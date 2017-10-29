module NotesHelper
    def note_url(note)
        notes_url + note.slug
    end
end
