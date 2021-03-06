<div align="center">
  <img src="assets/VNC.png" />
  <br/>
  <b>A programming language for Vietnamese</b>
  <br/>
  <br/>
  <a href="https://github.com/nguyenphuminh/VNC/blob/master/LICENSE.md"><img src="https://img.shields.io/badge/license-MIT-blue.svg"/></a>
  <a href="https://github.com/nguyenphuminh/VNC/search?l=batchfile"><img alt="language" src="https://img.shields.io/badge/language-Batchfile-purple.svg"></a>
</div>

# Print text with InRa[]
To print out a string or text, you use:

	InRa[] string

or you can prints text using:

	InRaDong[] string

The differences between InRa[] and InRaDong[] is that InRa[] prints out normal text, if there are no text printed out, there might be some errors. But InRaDong[] prints out a space then a text, if nothing is printed out, it will add a new line.

## Store data with InRa[]
You can actually store data to a file by using:

	InRa[] data>>file

# Special characters
Unlike any characters, "!" requires "^", for example:

	::This would causes no errors
	InRa[]] @#/
	
	::This would cause error ("!" will not be shown)
	InRa[] !
	
	::Correct codes:
	InRa[] ^!
	
The reason for this is that VNC has: SETLOCAL ENABLEDELAYEDEXPANSION which causes "!" to not be used properly.

# Unicode characters
To start using Unicode character, type:

	ChapNhanUnicode[] >nul

So now you can use Unicode characters:

	ChapNhanUnicode[] >nul
	InRa[] ă ê ©
	:: Would print out "ă ê ©"

# Prints out command's text
If you type:

	InRa[] InRa[]

It won't print out "InRa[]", but it will print out "echo", because VNC will compiles any statement/command without caring if it's a used data or not. So to actually print out "InRa[]", you will need to add "^" in any place of the command. Example:

	InRa[] InRa[^]
	:: This will print out "InRa[]"

# First note
To pause in VNC, please type in:
	
	TamDung[]

You will see this command underneath, but you should you this command to pause your program.

# Variables and data types

## Variables
To declare a variable as a string, you use:

	Dat[] variable_name=string_value

To declare a variable as an integer or evaluate math equation, you use:

	Tinh[] variable_name=integer_value

To evaluate an equation with a decimal result, use:

	SuDungThuVien[] ThuVienThapPhan
	ThapPhan[] "variable_name" "equation"

To declare a variable as an array, you use:

	data_type arr[array_index]=
	
Ex:
	
	Dat[] arr[0]=Hello
	Dat[] arr[1]=100
	
<b>Note: There is no real Array in VNC, the reason for naming arr[index] is to run for loops easier for all those "fake elements of a fake Array".</b>

To declare a variable from user's input, you use:

	Nhap[] variable_name=

Note: If you do this, it will prints out "Enter name:" right next to the input

	Nhap[] variable_name=Enter name:

### Maths 
You can do Math with VNC like this:

	Tinh[] result=1+1+2+4

If you do this, variable "result" will be "Hel + lo"

	Dat[] result=Hel + lo
	
<b>Math operators</b>
<br/>
<li>()                  - grouping</li>
<li>! ~ -               - unary operators</li>
<li>* / %               - arithmetic operators</li>
<li>+ -                 - arithmetic operators</li>
<li><< >>               - logical shift</li>
<li>&                   - bitwise and</li>
<li>^                   - bitwise exclusive or</li>
<li>|                   - bitwise or</li>
<li>= *= /= %= += -=    - assignment</li>
<li> &= ^= |= <<= >>= , - expression separator</li>
<li>++ --               - plus/minus 1</li>

## Some Math commands
	
### Print out an equation:

	ThucHien[] equation

### Assign the result of an equation to %fhsolved%

	ThucHienVaInKetQua[] equation
	
### Merge strings
To merge strings, do this:

	Dat[] str1=Hello
	Dat[] str2=World
	Dat[] str=%str1% %str2%

So the value of %str% is "Hello World"

Don't merge string like this:

	Dat[] str1=Hello
	Dat[] str2=World
	Dat[] str=%str1% + %str2%
	
This time, the value will be "Hello + World"


### Use variables in different commands
You can use variables in VNC commands as %variable_name%

For example, to print out a variable, you can do this:

	Dat[] result=Hello World^!
	InRa[] %result%
	
But, to print out an element of an array, you use:

	Dat[] a[0]=Hello
	InRa[] %a[0]%
	
To print out every element of an array, you can write something like this:

	BatDauCucBo[] ENABLEDELAYEDEXPANSION
	Tinh[] a[0]=100
	Tinh[] a[1]=35
	Tinh[] a[2]=20
	VongLap[] %%n in (0,1,2) do ( 
   		InRa[] ^!a[%%n]^! 
	)

Actually, there is a whole another way to create an array:

	Dat[] arr=1 2 3 4 5
	VongLap[] %%i in (%arr%) do (
		::Print out every elements
		InRa[] %%i
	)
	
### Local and global variables
You can declare a global variable by just using all the ways mentioned recently.

To declare a variable locally, you will need to use:

	BatDauCucBo[] 
	Tinh[] ans=100
	KetThucCucBo[]
	
BatDauCucBo[] and KetThucCucBo[] helps create a local environment.

In Batch, to use variable in for loops, or enables command prosessor's extensions, you would need:

	setlocal ENABLEDELAYEDEXPANSION
	setlocal ENABLEEXTENSIONS
	
You can also do that with BatDauCucBo[]

	BatDauCucBo[] ENABLEDELAYEDEXPANSION
	BatDauCucBo[] ENABLEEXTENSIONS
	
<b>Note: DELAYEDEXPANSION is already enabled in VNC. So you wouldn't need to enable it actually.</b>

### Special variables
<li>%random% - A variable with the value of a random number between 10000 and 99999</li>
<li>%time% - A variable with the value as the current timer</li>
<li>%dat[]e% - A variable with the value as the current dat[]e</li>
<li>%cd% - A variable with the value as the current directory</li>
<li>%errorlevel% - A variable with the value as the current Batch errorlevel value</li>
<li>%cmdextversion% - A variable with the value as the current Command Processor Extensions version number</li>
<li>%cmdcmdline% - A variable with the value as the original command line that invoked the Command Processor</li>
<li>%path% - A variable with the value as all environment variables</li>
<li>%highestnumanodenumber% - A variable with the value as the highest NUMA node number on this machine</li>

There are a lot of special variables left, but you might not find uses for them

### Implementations on variables
<li>%variable_name:~0,-2% - would extract all but the last 2 characters of the variable</li>
<li>%variable_name:~-5% - would extract the last 5 characters of the variable</li>
<li>%variable_name:~5% - would remove the first 5 characters of the variable</li>
<li>%variable_name:str1=str2% - would replace str1 with str2</li>
<li>%PATH:~10,5% - would expand the PATH environment variable, and then use only the 5 characters that begin at the 11th (offset 10) character of the expanded result.  If the length is not specified, then it defaults to the remainder of the variable value.  If either number (offset or length) is negative, then the number used is the length of the environment variable value added to the offset or length specified/li>

### Notes
There are variables that you CAN NOT USE like: %a%, %printString%, %fccompile%, %fccompilename%, %fcread%.

Also, spaces in VNC is extremely important, so if you declare a variable like this:

	Tinh[] abc = 100

It will declare the "abc " variable, so if you prints it out like this, it will not work

	InRa[] %abc%
	
You will have to code like this:

	InRa[] %abc %
	
Then, it will prints out " 100"

Other thing that you should notice is that 

	Dat[] text
	
would return any variable begins with "text"

# Comments
Single-line comment:

	:: Comment

Another way:

	rem comment

Multi-line comment:

	/* comment
	*/

Hide comment:

	CTAN comment

# Labels and Goto statement
Labels helps you to jump to a state or pass parameters to execute tasks (somewhat procedural programming).

To create a label/procedure, you use:

	Moc[] label_name

To jump to a label, you use:

	DiToi[] label_name

To call a label/procedure, you use:

	GoiThuTuc[] :label_name

Or:

	GoiHam[] label_name

GoiThuTuc[] can also targets file, while GoiHam[] can only targets label/function. For example, you can execute files like this:

	GoiThuTuc[] file_name

### Differences between DiToi[] and GoiThuTuc[]
DiToi[] jumps to a function and will not execute the previous code while GoiThuTuc[] use code from the function but still execute the previous code.

Also, GoiThuTuc[] also supports parameters, which helps you a lot of time.

For examples, this code will print the sum of two parameters:

	GoiThuTuc[] :plus 1 2
	Moc[] plus
	Tinh[] ans=%~1 + %~2
	InRa[] %ans%

Note: Parameters in VNC are %~1, %~2,...

### Notes
To restart the program, you can type:

	DiToi[] VNCCompiled

It is because the compiled code of VNC is in a main label/procedure "VNCCompiled"

This code would still work eventhough it contains special character

	DiToi[] dsasd$ 123213 323
	DiToi[] dsasd$ 123213 323


# Macro
You can create a macro like this:

	:: A macro which prints out "Hello"
	Dat[] hello= InRa[] Hello
	%hello%
	
You can join commands together like this:

	Dat[] hello= InRa[] Hello ^& InRa[] Hell yeah!

# Procedural programming

	TaoHam[] Procedure_name
		:: Code goes here
	DongHam[]

Example:

	TaoHam[] SayHello
		InRa[] Hello
	DongHam[]
	:: Prints "Hello"
	GoiThuTuc[] SayHello
	
# Object Oriented Programming
You can implement OOP like this:

	:: Create a procedure called "Dog"
	TaoHam[] Dog
		::Set properties
		PoopString[] %~1.age=%~2
		PoopString[] %~1.weight=%~3
		(
			InRa[] InRa[] *Being cute*
		)>%~1.BeingCute.bat
	DongHam[]

	:: Create an object
	GoiThuTuc[] Dog "Mary" "3" "4kg"
	:: Prints out "age" property of "Mary", which is "3"
	InRa[] Age: %Mary.age%
	:: Call "Mary.BeingCute", which prints out "*Being cute*"
	GoiThuTuc[] Mary.BeingCute
	
# If statements
To use if statement, type:

	Neu[] condition command_to_execute
	
Example:

	Tinh[] abc=100
	Neu[] %abc% == 100 (
		InRa[] abc is equal to 100
	)
	
You can actually use a Batch command in Neu[]. Example:

	Tinh[] abc=20
	Neu[] %abc% == 20 (
		echo abc is equal to 100
	)
	
## All the comparison operators:
<li>"==" - Equal</li>
<li>"EQU" - Equal</li>
<li>"NEQ" - Not equal</li>
<li>"LSS" - Less than</li>
<li>"LEQ" - Less than or equal</li>
<li>"GTE" - Greater than</li>
<li>"GEQ" - Greater than or equal</li>

## Other kinds or if statements:

### Execute if a file exists

	NeuTonTai[] file_name (
		command_to_execute
	)
	
### Execute if a variable is defined

	NeuDaKhoiTao[] variable_name (
		command_to_execute
	)
	
### Execute if a condition is false

	NeuKhongPhai[] condtition (
		command_to_execute
	)

### Else

	Neu[] condition (
		command_to_execute
	) KhongThi[] (
		command_to_execute
	)

## Notes
To use if not for Neu[]DaKhoiTao or Neu[]TonTai, you can do this:

	NeuKhongTonTai[] file (
		command_to_execute
	)
	NeuChuaKhoiTao[] file (
		command_to_execute
	)
	
## Pressing keys with respond
To receive keys pressed, add:

	GoPhim[] key
	
For examples, if you want the users to press one in "wsad", type:

	GoPhim[] wsad

To perform any actions, you will need to use a special if statement:

	Neu[]Phim position_of_key_in_GoPhim

Example:

	GoPhim wsad
	NeuPhim[] 4 (
		InRa[] You pressed "D"
	)
	NeuPhim[] 3 (
		InRa[] You pressed "A"
	)
	NeuPhim[] 2 (
		InRa[] You pressed "S"
	)
	NeuPhim[] 1 (
		InRa[] You pressed "W"
	) 

### If not for tapping
You can use:

	NeuPhimKhongLa[]
	
to use if not.

## Instant condition checking
You can type this to check if the condition is true or false instantly:

	KiemTraVaInKetQua[] condition
	
Then, it will prints out "Yes" if true, "No" if false.

For example, this will prints out "Yes"

	KiemTraVaInKetQua[] "hello" == "hello"
	
You can also do this:

	KiemTra[] condition

It will assign 'Yes' or 'No' to %tmhres%.

# Loops

## For loops

### Loops from m to n

	VongLap[] %%parameters in (start,step,end) do (
	)
	
### Loops through files rooted in a folder

	QuetFile[] drive/directory %%parameters in (file) do (
	)
	
### Loops through strings or strings in a file

	QuetChuoi[] drive/directory %%parameters in (string/file) do (
	)
	
### Loops through a file 

	QuetNoiDung[] %%parameters in (set) do (
	)
	
### Loops through a folder

	QuetThuMuc[] %%parameters in (folder) do (
	)
	
## While loops
While loops can be created using:

	LapKhi[] condition
		::code
	NgungLap[]

Of course, the loops will run when the condition is still true, stop when false.

### Do-While loop

	LapLienTuc[]
		::code
	ChoToiKhi[] condition

### Differences between While and Do-While
While loop is executed only when given condition is true. Whereas, do-while loop is executed for first time irrespective of the condition. After executing while loop for first time, then condition is checked.

### Notes when using while loops
<b>YOU CAN NOT USE NESTED WHILE LOOPS</b>
<br/>
This will be wrong:

	LapKhi[] condition
		LapKhi[] condition
		NgungLap[]
	NgungLap[]

<b>(Same with Do-While)</b>

## The better way for loops
You can use somewhat "recursion" like this:

	Dat[] i=start_number
	DiToi[] loop
	command
	Neu[] %i% == end_number DiToi[] nextcode
	Tinh[] i++
	DiToi[] loop
	
	DiToi[] nextcode
	command
	
For example, this program will print all the number from 0 to 10 then print out "Done!":

	Tinh[] i=0
	DiToi[] loop
	InRa[] %i%
	Neu[] %i% == 10 DiToi[] nextcode
	Tinh[] i++
	DiToi[] loop
	
	DiToi[] nextcode
	InRa[] Done^!


# Use Batch in VNC
Unlike all the previous release, now VNC support writing Batch without any other commands. So you can actually learn Batch and write Batch codes in VNC.

# Import pre-built libraries
To import a pre-built library, use:

	SuDungThuVien[] lib_name
	
## Using "ThuVienMang"

	SuDungThuVien[] arrayfunc
	
	:: Find sum of list
	TongSoHangCuaDay[] "variable_name" "list"
	
	:: Find maximum of list
	SoLonNhatCuaDay[] "variable_name" "list"
	
	:: Find minimum of list
	SoNhoNhatCuaDay[] "variable_name" "list"
	
	:: Example:
	SoLonNhatCuaDay[] "max_num" "2 3 1 8 5"
	:: This will prints out "8"
	InRa[] %max_num%
	
### Note
All the functions above only works with list with all integers. String or floats will cause errors.
	
## Using "ThuVienToanHoc"

	SuDungThuVien[] math

	:: Absolute
	GiaTriTuyetDoi[] "variable_name" "number"
	
	:: Check if a number is odd
	KiemTraLe[] "variable_name" "number"

	:: Check if a number is even
	KiemTraChan[] "variable_name" "number

	:: Power
	Mu[] "variable_name" "number" "power_num"
	
	:: Factorial
	GiaiThua[] "variable_name" "number"
	
## Using "ThuVienChuoi"

	SuDungThuVien[] ThuVienChuoi
	
	:: Length of string
	DoDaiChuoi[] "variable_name" "string"
	
	:: To uppercase
	InHoa[] "variable_name" "number"
	
	:: To lowercase
	InThuong[] "variable_name" "number"
	
	:: Reverse
	DaoChuoi[] "variable_name" "string"
	
## Loading lib entirely with GoiThuTuc[]
Example:

	:: Check if a number is odd
	GoiThuTuc[] fclib_math_odd.bat "variable_name" "number"

# Nul in VNC
It's just like nul in Batch, so if you want to make your console not print out any process, you can do it like this:

	Command >nul
	
To hide errors, you can do this:

	Command >nul 2>nul

# Creating and Inserting modules
You can create a module file using:

	KhaiBaoBoPhan[]

Note: The "KhaiBaoBoPhan[]" command needs to stay at the top of the file.

Then, include it in the main file using:

	Chen[] module_name.bat
	::Note: You have to replace .vnc with .bat

Then, compile the module file first, then compile the main file at the end.

### Example:
Create a file called "module.vnc" with:

	KhaiBaoBoPhan[]
	InRa[] World

Create a file called "program.vnc" with:

	InRa[] Hello
	Chen[] module.bat

In the command window, type:

	vnc module --dich
	vnc program

It will prints out:

	Hello
	World

If you are a C++ dev, this would be an equivalent to "#include".

# Other useful commands

### Exit the program

	Thoat[]
	
### Shutdown system	
	
	TatMay[]
	::Add /t time and /c "comment" to set the time to shutdown and leave a comment before shutdown
	
### Restart system

	KhoiDongLai[]
	::Add /t time and /c "comment" to set the time to shutdown and leave a comment before restart
	
### Create a folder

	TaoThuMuc[] folder_name
	
### Access a folder
	
	ChuyenVaoThuMuc[] folder_name
	
### Access a drive
	
	TruyCapO[] drive_name
	
### Read a file

	DocTapTin[] file_name
	
### Clear the screen

	An[]
	
### Pause

	TamDung[]

### Delete a file

	XoaTapTin[] file
	
### Delete a folder
	
	XoaThuMuc[] folder_name

### Check if a number is odd or is even

	KiemTraChanLe[] number
	
### Change color, a pair of hex code is a color code

	DoiMau[] hex_code

<li>0 = Black</li>
<li>1 = Blue</li>
<li>2 = Green</li>
<li>3 = Aqua</li>
<li>4 = Red</li>
<li>5 = Purple</li>
<li>6 = Yellow</li>
<li>7 = White</li>
<li>8 = Gray</li>
<li>9 = Light Blue</li>
<li>A = Light Green</li>
<li>B = Light Aqua</li>
<li>C = Light Red</li>
<li>D = Light Purple</li>
<li>E = Light Yellow</li>
<li>F = Bright White</li>
	
### Change the title of the program

	DoiTieuDe[] title_name
	
### Change console's size

	DoiKichCo[] size_number
	DoiKichCo[] con cols=columns_or_width lines=lines_or_height
	
### Rename a file

	DoiTenTapTin[] file_name
	
### Move a file to the new path

	DiChuyenTapTin[] file_name new_path
	
### Copy a file to the new path

	SaoChepTapTin[] file_name new_path
	
### Open a file or a website url (would open cmd if nothing is opened)

	MoTapTin[] file
	
### Timeout for a specific time

	Cho[] time_as_second

### Restart the program or loop the program endlessly

	LapChuongTrinh[]
	
### Shows dat[]e

	XemNgay[]
	
### Shows time

	XemGio[]
	
### Shows all files in the current directory

	XemMucVaTep[]
	
### Show command prompt content

	AnCuaSoLenh[]

<b>This would be useful for debugging.</b>
	
### Hide command prompt content

	HienCuaSoLenh[]
	
<b>Note: All the command prompt content is hiden by default</b>

### Prompt for dat[]e to change dat[]e

	DoiNgay[]
	
<b>Note: Administrator is required to run the command</b>
	
### Prompt for time to change time

	DoiGio[]

<b>Note: Administrator is required to run the command</b>

# Disable prebuilt variables
You can disable numpoop, numpiss, numpuke,... by putting this block of code on top of your program:

	KhaiBaoBoPhan[]
	AnCuaSoLenh[]
