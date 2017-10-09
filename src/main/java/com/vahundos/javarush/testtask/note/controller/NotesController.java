package com.vahundos.javarush.testtask.note.controller;

import com.vahundos.javarush.testtask.note.entity.Note;
import com.vahundos.javarush.testtask.note.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
public class NotesController {

    @Autowired
    private NoteService noteService;

    @RequestMapping(method = RequestMethod.GET)
    public String showAllNotes(Model model) {
        model.addAttribute("notes", noteService.getAllNotes());
        model.addAttribute("dateFormatter", DateTimeFormatter.ofPattern("HH:mm:ss dd.MM.yyyy"));
        return "index";
    }

    @Bean
    @Lazy
    private DateTimeFormatter getFormatter() {
        return DateTimeFormatter.ofPattern("HH:mm:ss dd.MM.yyyy");
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
