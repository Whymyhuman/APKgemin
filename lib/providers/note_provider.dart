import 'package:flutter/material.dart';
import '../models/note.dart';
import '../helpers/database_helper.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes = [];
  bool _isLoading = false;
  String _searchQuery = '';

  List<Note> get notes {
    return _searchQuery.isEmpty
        ? _notes
        : _notes
            .where((note) =>
                note.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                note.content.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();
  }

  bool get isLoading => _isLoading;

  NoteProvider() {
    fetchNotes();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> fetchNotes() async {
    _isLoading = true;
    notifyListeners();
    try {
      _notes = await DatabaseHelper.instance.readAllNotes();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addNote(String title, String content) async {
    final newNote = Note(
      title: title,
      content: content,
      lastModified: DateTime.now(),
    );
    await DatabaseHelper.instance.create(newNote);
    fetchNotes();
  }

  Future<void> updateNote(Note note) async {
    await DatabaseHelper.instance.update(note);
    fetchNotes();
  }

  Future<void> deleteNote(int id) async {
    await DatabaseHelper.instance.delete(id);
    fetchNotes();
  }
}
