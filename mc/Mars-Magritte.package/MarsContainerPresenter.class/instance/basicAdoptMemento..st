private
basicAdoptMemento: aMemento 
	super basicAdoptMemento: aMemento.
	self children do: [ :each | each adoptMemento: aMemento ]