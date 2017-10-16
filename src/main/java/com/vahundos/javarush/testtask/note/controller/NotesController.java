package com.vahundos.javarush.testtask.note.controller;

import com.vahundos.javarush.testtask.note.entity.Note;
import com.vahundos.javarush.testtask.note.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;
import java.util.Map;

@Controller
public class NotesController {

    private static final int NOTES_ON_PAGE = 10;

    @Autowired
    private NoteService noteService;

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String showAllNotes(@CookieValue(name = "filterType", defaultValue = "ALL") String filterTypeCookie,
                               @CookieValue(name = "sort", defaultValue = "NEW") String dateSortCookie,
                               @RequestParam(name = "page", required = false, defaultValue = "1") String pageStr,
                               Model model, HttpServletResponse response) {

        if (!getFilterMap().containsKey(filterTypeCookie) || !getSortMap().containsKey(dateSortCookie)) {
            response.addCookie(new Cookie("filterType", "ALL"));
            response.addCookie(new Cookie("sort", "NEW"));
            return "error";
        }

        int pagesCount = getPageCount(filterTypeCookie);
        int pageNumber = getPageNumber(pageStr, pagesCount);
        int firstRecord = (pageNumber - 1) * NOTES_ON_PAGE; // from 0
        model.addAttribute("notes", noteService.getAllNotes(filterTypeCookie, dateSortCookie,
                firstRecord, NOTES_ON_PAGE));

        model.addAttribute("pageCount", pagesCount);
        model.addAttribute("currentFilter", filterTypeCookie);
        model.addAttribute("currentSort", dateSortCookie);
        model.addAttribute("filterMap", getFilterMap());
        model.addAttribute("sortMap", getSortMap());
        model.addAttribute("dateFormatter", DateTimeFormatter.ofPattern("HH:mm:ss dd.MM.yyyy"));
        return "index";
    }

    private int getPageCount(String filterType) {
        int notesCount = (int) noteService.getNoteCount(filterType);
        int pagesCount = notesCount / NOTES_ON_PAGE;
        return notesCount % NOTES_ON_PAGE == 0 ? pagesCount : pagesCount + 1;
    }

    private int getPageNumber(String pageStr, int pagesCount) {
        int pageNumber = Integer.parseInt(pageStr);
        return pageNumber > pagesCount ? pagesCount : pageNumber;
    }

    @Bean
    @Lazy
    private DateTimeFormatter getFormatter() {
        return DateTimeFormatter.ofPattern("HH:mm:ss dd.MM.yyyy");
    }

    @Bean
    @Lazy
    private Map<String, String> getFilterMap() {
        Map<String, String> filterMap = new LinkedHashMap<>();
        filterMap.put("ALL", "Все");
        filterMap.put("DONE", "Только выполненые");
        filterMap.put("NOT_DONE", "Только невыполненые");
        return filterMap;
    }

    @Bean
    @Lazy
    private Map<String, String> getSortMap() {
        Map<String, String> sortMap = new LinkedHashMap<>();
        sortMap.put("NEW", "Сначала новые");
        sortMap.put("OLD", "Сначала старые");
        return sortMap;
    }

    @RequestMapping(path = "/add-note", method = RequestMethod.GET)
    public String showAddNotePage(Model model) {
        model.addAttribute("noteObj", new Note());
        model.addAttribute("postPath", "add-note");
        return "add-update-note";
    }

    @RequestMapping(path = "/add-note", method = RequestMethod.POST)
    public String addNote(@ModelAttribute("noteObj") Note note) {
        note.setCreatedDate(LocalDateTime.now());
        noteService.add(note);
        return "redirect:/";
    }

    @RequestMapping(path = "/update-note", method = RequestMethod.GET)
    public String showUpdateNotePage(@RequestParam(name = "id") long id, Model model) {
        model.addAttribute("noteObj", noteService.getNoteById(id));
        model.addAttribute("postPath", "update-note");
        return "add-update-note";
    }

    @RequestMapping(path = "/update-note", method = RequestMethod.POST)
    public String updateNote(@ModelAttribute("noteObj") Note note) {
        noteService.update(note);
        return "redirect:/";
    }

    @RequestMapping(path = "/remove-note", method = RequestMethod.GET)
    public String removeNote(@RequestParam(name = "id") long id) {
        noteService.remove(id);
        return "redirect:/";
    }

    @ExceptionHandler({Exception.class, RuntimeException.class})
    public String showErrorPage() {
        return "error";
    }
}
