package com.stackroute.keepnote.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.stackroute.keepnote.model.Note;

/*
 * This class is implementing the NoteDAO interface. This class has to be annotated with @Repository
 * annotation.
 * @Repository - is an annotation that marks the specific class as a Data Access Object, thus 
 * 				 clarifying it's role.
 * @Transactional - The transactional annotation itself defines the scope of a single database 
 * 					transaction. The database transaction happens inside the scope of a persistence 
 * 					context.  
 * */
@Repository
@Transactional
public class NoteDAOImpl implements NoteDAO {

	/*
	 * Autowiring should be implemented for the SessionFactory.
	 */
	@Autowired
	SessionFactory sessionFactory;

	public NoteDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/*
	 * Save the note in the database(note) table.
	 */

	public boolean saveNote(Note note) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(note);
		currentSession.flush();
		return true;
	}

	/*
	 * Remove the note from the database(note) table.
	 */

	public boolean deleteNote(int noteId) {
		if (getNoteById(noteId) == null) {
			return false;
		} else {
			Session currentSession = sessionFactory.getCurrentSession();
			currentSession.delete(getNoteById(noteId));
			currentSession.flush();
			return true;

		}
	}

	/*
	 * retrieve all existing notes sorted by created Date in descending
	 * order(showing latest note first)
	 */
	public List<Note> getAllNotes() {
		String hqlQuery = "FROM Note note ORDER BY note.createdAt DESC";
		Query<Note> query = getSessionFactory().getCurrentSession().createQuery(hqlQuery);
		return query.getResultList();
	}

	/*
	 * retrieve specific note from the database(note) table
	 */
	public Note getNoteById(int noteId) {
		return sessionFactory.getCurrentSession().get(Note.class, noteId);
	}

	/* Update existing note */

	public boolean UpdateNote(Note note) {
		if (getNoteById(note.getNoteId()) == null) {
			return false;
		} else {
			sessionFactory.getCurrentSession().clear();
			sessionFactory.getCurrentSession().update(note);
			sessionFactory.getCurrentSession().flush();
			return true;
		}

	}

}
