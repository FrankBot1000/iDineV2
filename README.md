
Code challenges added to the "iDine App" by Paul Hudson, from the "Building a complete project" chapter in his "SwiftUI by Example" book. 

Added the following code for the three challenges at the end of the chapter:
(1) Customized the "Order This" button with a custom font and background.

(2)  Added "Pickup time" Picker to the CheckoutView, with "Now", "Tonight" and "Tomorrow Morning" options.
	Also, added a message for the "Pickup time" within the Alert, after the "Confirm Order" button is pressed.

(3) Added a Favorite navigation bar item to the ItemDetail and a Favorites tab for showing the favorites.
	The favorites are grouped into item types, in Sections.
	Some refactoring:
		Using an enum instead of an array for reading favorite items.
		The favorites Section code is abstracted out into a separate FavoritesSection View.
		Using a closure instead of calling deleteItems, for the .onDelete modifier.
