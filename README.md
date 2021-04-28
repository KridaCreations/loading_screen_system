# loading_screen_system
a system to implement loading screen in godot game engine made in GODOT version 3.2.2

GETTING A BLACK SCREEN WHEN YOUR SCREEN IS LOADED!!!!!!

DON'T WORRY HERE I HAVE IMPLEMENTED A SIMPLE LOADING SCREEN TO SIMPLIFY YOUR WORK
JUST FOLLOW THE STEPS :-



1) Download the zip file of github repository. extract it 
2) copy the folder with name "loading_screen_assets" to the main directory of your godot project.
3) create a autoload singleton with the script "global.gd" provided inside the folder "loading_screen_assets" with name "Global"
4) create another autoload singleton with the scene "globalscene.tscn" provided inside the folder "loading_screen_assets" with name "Globalscene".
5) open the globalscene.tscn you will find a property of type string with name "first_scene", provide the path of scene you want to start the game.   
6) create another empty 2d scene name it anything and set this scene is main scene(from project settings), this scene will act as the intial scene which godot will load.
7) now whenever you want to change the scene use goto_scene function from the "Global" singleton by eg:- Global.goto_scene("res://startingscreen.tscn") ,this will lead you to the scene if the path is correct.


if you are getting an error feel free to open a issue
 
