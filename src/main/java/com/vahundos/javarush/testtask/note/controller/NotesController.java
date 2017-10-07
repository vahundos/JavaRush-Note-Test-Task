package com.vahundos.javarush.testtask.note.controller;

import com.vahundos.javarush.testtask.note.entity.Note;
import com.vahundos.javarush.testtask.note.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
        model.addAttribute("noteForm", new Note());
        return "add-update-node";
    }

    @RequestMapping(path = "/add-note", method = RequestMethod.POST)
    public String submit(@ModelAttribute("noteForm") Note note, Model model) {
        note.setDone(false);
        note.setCreatedDate(LocalDateTime.now());
        noteService.add(note);

        return "redirect:index";
    }
}
