
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_id
    self.genre ? self.genre.id : nil
  end

  def genre_id=(id)
    self.genre = Genre.find_by(id: id)
  end

  def note_content
    self.notes ? self.notes : nil
  end

  def note_content=(contents)
    contents.delete("")
    if contents.any?
      contents.each do |content|
        note = self.notes.build(content: content)
        note.save
      end
    end
  end

end

