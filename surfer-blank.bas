Sub Main


	'Get existing Surfer instance, or create a new one If none exists.
	On Error Resume Next 'Turn off error reporting.
	Set SurferApp = GetObject(,"Surfer.Application")
	If Err.Number<>0 Then
		Set SurferApp = CreateObject("Surfer.Application")
		SurferApp.Documents.Add(srfDocPlot)
	End If
	On Error GoTo 0 'Turn on error reporting.

	'Version returns the full version number of Surfer
 	Debug.Print "-----------------------------------------------------"
	Debug.Print "Surfer ";SurferApp.Version;" Application Object Properties"
 	Debug.Print "-----------------------------------------------------"

'Visible sets the visiblity of the Surfer applicaiton
	SurferApp.Visible = True

	Dim Plot As Object
	Set Plot = SurferApp.Documents.Add
    Dim GridFile As String
    Dim Dir As String
    
    Dir = CurDir$()


	DataFile = Dir+"\out.txt"
	OutGrid = Dir + "\out.grd"
    blnFile =  Dir + "\OUT-B.BLN"
    outblngrid = Dir + "\b_out.bln"
    
	SurferApp.GridData (DataFile:=DataFile,xCol:=1, yCol:=2, zCol:=3, Algorithm:=srfKriging, OutGrid:=OutGrid)
    
    SurferApp.GridBlank (InGrid:=OutGrid, BlankFile:=blnFile, Outgrid:=outblngrid)
    
	Set MapFrame = Plot.Shapes.AddContourMap(GridFileName:=outblngrid)

'设置色标
	Dim ContourLayer As Object
	Set ContourLayer = MapFrame.Overlays(1)
	ContourLayer.FillForegroundColorMap.LoadFile(SurferApp.Path + "\ColorScales\Rainbow.clr")
	ContourLayer.LevelMethod = SrfConLevelMethodSimple
	ContourLayer.FillContours = True
	ContourLayer.ShowColorScale = True

' 设置坐标名
	Dim Axes As Object
 	Set Axes = MapFrame.Axes
 'Assigns the different axes to variable names
 		Set BottomAxis = Axes("Bottom axis")
 		Set LeftAxis = Axes("Left axis")
 		Set RightAxis = Axes("Right axis")
 		Set TopAxis = Axes("Top axis")

'Sets the title properties for the axis.
		TopAxis.Title = " Apparent Resistivity (\f""Symbol"" W×\f""Arial"" m\f""Symbol"" )"
        TopAxis.TitleFont.Size = 24
        BottomAxis.Title = "X / m"
       LeftAxis.Title = "OO'/2 / m"
        




	Plot.SaveAs(FileName := Dir+"\plot.srf")


End Sub
