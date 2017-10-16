package com.vahundos.javarush.testtask.note.dao;

import com.vahundos.javarush.testtask.note.entity.Note;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.TypedQuery;
import java.util.List;

@Repository
public class NoteDaoImp implements NoteDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void add(Note note) {
        sessionFactory.getCurrentSession().save(note);
    }

    @Override
    public void update(Note note) {
        sessionFactory.getCurrentSession().update(note);
    }

    @Override
    public void remove(long id) {
        sessionFactory.getCurrentSession().remove(getNoteById(id));
    }

    @Override
    public Note getNoteById(long id) {
        return sessionFactory.getCurrentSession().get(Note.class, id);
    }

    @Override
    public List<Note> getAllNotes(String filter, String sort) {
        String sql = "from Note N ";

        if (filter.equals("DONE"))
            sql += "WHERE N.done = 1 ";
        else if (filter.equals("NOT_DONE"))
            sql += "WHERE N.done = 0 ";

        if (sort.equals("OLD"))
            sql += "ORDER BY N.createdDate DESC";
        else if (sort.equals("NEW"))
            sql += "ORDER BY N.createdDate ASC";

        TypedQuery<Note> query = sessionFactory.getCurrentSession().createQuery(sql, Note.class);
        return query.getResultList();
    }

    @Override
    public long getNoteCount() {
        return sessionFactory.getCurrentSession().createQuery("SELECT COUNT(*) FROM Note",
                Long.class).getSingleResult();
    }
}
