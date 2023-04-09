# make_album(artist_name, album_title, song_count=None)
# return dictionary of artist name and album title
# print each return value
# at least 1 function call should include song count

def make_album(artist_name, album_title, song_count=None):
    """
    Create dictionary of artist name, album title,
    and song count (optional)
    """
    album = {
        "Artist" : artist_name.title(),
        "Album" : album_title.title(),
    }

    if song_count:
        album["Song"] = song_count
    
    return album

print(make_album("Artist 1", "Album 1", 20))
print(make_album("Artist 2", "Album 2"))
