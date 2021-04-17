Your all members are final with his data-type.
Add default value in constructor calling.
    SquareTextFieldWidget({
        this.myController,
        this.myMargin = const EdgeInsets.all(0),
        })
Use @required if some member is must be require.
Never user hardcoded width/height unless widgets has his own width or height.
Stop passing context in your widgets.
Use trailing comma.
Don't miss to add super constructor with Key key.