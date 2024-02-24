using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class Shape : MonoBehaviour
{
    public string name_tag;
    public int vertex;

    void Start()
    {
        BuildingReg Reg = new BuildingReg();
        BuildingTri Tri = new BuildingTri();
        Debug.Log(Reg.name_tag = "Regtangle");
        Debug.Log(Reg.vertex = 20);

        Debug.Log(Tri.name_tag = "Triangle");
        Debug.Log(Tri.vertex = 10);
    }

    void Update()
    {

    }

}

public class BuildingReg : Shape
{
    void Start()
    {
        name_tag = "Regtangle";
        vertex = 20;
    }

}

public class BuildingTri : Shape
{
    void Start()
    {
        name_tag = "Triangle";
        vertex = 15;
    }

}

