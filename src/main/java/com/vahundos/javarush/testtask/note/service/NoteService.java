package com.vahundos.javarush.testtask.note.service;

import com.vahundos.javarush.testtask.note.entity.Note;

import java.util.List;

public interface NoteService {
    void add(Note note);
    void update(Note note);
    void remove(long id);
    Note getNoteById(long id);
    List<Note> getAllNotes();
    List<Note> getAllDoneNotes();
    List<Note> getAllNotDoneNotes();
}
