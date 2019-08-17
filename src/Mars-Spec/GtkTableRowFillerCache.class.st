"
I'm a dinamic variable used to cache repeated objects in tables and lists. 
Tipically, this is to cache icon images which otherwise would be recreated unnecesarely. 

Using a cache, I'm sure I will reuse the images I already have.
"
Class {
	#name : #GtkTableRowFillerCache,
	#superclass : #DynamicVariable,
	#category : #'Mars-Spec-Adapter-Table'
}
