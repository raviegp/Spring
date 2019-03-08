package com.stackroute.keepnote.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;

import com.stackroute.keepnote.model.Note;

/*
 * This class contains the code for data storage interactions and methods 
 * of this class will be used by other parts of the applications such
 * as Controllers and Test Cases
 * */
@Repository
public class NoteRepository {

	/* Declare a variable called "list" to store all the notes. */
	List<Note> notes;

	public NoteRepository() {

		/* Initialize the variable using proper data type */
		this.notes = new ArrayList<Note>();
	}

	/* This method should return all the notes in the list */

	public List<Note> getList() {
		return this.notes;
	}

	/* This method should set the list variable with new list of notes */

	public void setList(List<Note> list) {
		this.notes = list;
	}

	/*
	 * This method should Note object as argument and add the new note object into
	 * list
	 */

	public void addNote(Note note) {
		this.notes.add(note);
	}

	/* This method should deleted a specified note from the list */

	public boolean deleteNote(int noteId) {
		/* Use list iterator to find matching note id and remove it from the list */
		List<Note> collect = this.notes.stream().filter(note -> note.getNoteId() != noteId)
				.collect(Collectors.toList());
		if (this.notes.size() == collect.size()) {
			System.out.println("provided element not found");
			return false;
		} else {
			this.notes = collect;
			return true;
		}
	}


	/* This method should return the list of notes */

	public List<Note> getAllNotes() {
		return this.notes;
	}

	/*
	 * This method should check if the matching note id present in the list or not.
	 * Return true if note id exists in the list or return false if note id does not
	 * exists in the list
	 */

	public boolean exists(int noteId) {
		List<Note> collect = this.notes.stream().filter(note -> note.getNoteId() != noteId)
				.collect(Collectors.toList());
		if (this.notes.size() == collect.size()) {
			System.out.println("Provided note not found " + noteId);
			return false;
		} else {
			return true;
		}
	}

}