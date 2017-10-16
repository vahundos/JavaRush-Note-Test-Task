package com.vahundos.javarush.testtask.note.service;

import com.vahundos.javarush.testtask.note.dao.NoteDao;
import com.vahundos.javarush.testtask.note.entity.Note;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NoteServiceImp implements NoteService {

    @Autowired
    private NoteDao noteDao;

    @Transactional
    @Override
    public void add(Note note) {
        noteDao.add(note);
    }

    @Transactional
    @Override
    public void update(Note note) {
        noteDao.update(note);
    }

    @Transactional
    @Override
    public void remove(long id) {
        noteDao.remove(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Note getNoteById(long id) {
        return noteDao.getNoteById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Note> getAllNotes(String filter, String sort) {
        return noteDao.getAllNotes(filter, sort);
    }

}
