using Godot;
using System;

public partial class haver : Node
{
    private int count = 0;

    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
    {
    }

    // Called every frame. 'delta' is the elapsed time since the previous frame.
    public override void _Process(float delta)
    {
        count++;
        if (count == 21)
        {
            return; // Exit the _Process method once count reaches 21
        }

        CountUpdate();
    }

    public void CountUpdate()
    {
        string str = "Updates: " + count;
        GD.Print(str); // Use GD.Print instead of print
        PrintSum(4.3f, 10.5f);
    }

    public void PrintSum(float a, float b)
    {
        GD.Print(a + b); // Use GD.Print instead of print
    }
}
