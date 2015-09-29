# Object-Following-Robot
A robot which can follow a table tennis ball using image processing.
You can use any free software like Octave or paid software-MATLAB to run the .m file. You need an Arduino IDE to run .ino file. It is freely available.
The code for written for Arduino UNO but is compatible for Mega also. You need to connect your arduino board to system using a USB wire and find out which COM port it is connected to. You can find it out in Device Manager. Accordingly make changes is line number 22 of "img_process.m".
After connecting Arduino to the system and uploading actuate.ino code to it, you can run img_process.m in Octave/MATLAB.
If you don't want to work with Arduino and just want to work on image processing code, refer to "ofr_withoutSerial.m".
