
# surfer-blank.bas #


增加功能

- 增加坐标轴设置

遇到问题，basic中，字符串中包含引号需要使用两个连续的引号，即*""*，所以会出现类似下面的语句，坐标轴设置语句为：

	TopAxis.Title = " Apparent Resistivity (\f""Symbol"" W×\f""Arial"" m\f""Symbol"" )"
	TopAxis.TitleFont.Size = 24
	BottomAxis.Title = "X / m"
	LeftAxis.Title = "OO'/2 / m"

- 以后根据需要，将所有格式设置好，然后统一输入字符串

效果如图所示

![mod1](https://raw.githubusercontent.com/armslave7/surfer-script/dev/fig/mod2.jpg)




# surfer-blank.bas v1 #

10/11/2016 8:58:59 AM 

数据格式类似如下所示

      X       Y           ρs
     1.5    -1.0     8.564050E+01
	...

grid---x和y坐标，以及第三列值，
文件名为**out.dat**，输出为**out.grd**
白化文件名为**OUT-B.BLN**，白化之后的网格文件为**b_out.bln**，
自动化成图效果为

![mod1](https://raw.githubusercontent.com/armslave7/surfer-script/dev/fig/mod1.jpg)