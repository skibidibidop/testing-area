# use code from 8-7
# use while loop to get input

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

while True:
    proceed = input("Input details? y/n ")

    if proceed == "n":
        break

    artist_name2 = input("\nArtist: ")
    album_name2 = input("Album: ")
    song_count2 = input("Song count(optional, hit Enter "
                        "to skip): ")
    print(make_album(artist_name2, album_name2, song_count2))
