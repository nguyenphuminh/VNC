<div align="center">
  <img src="assets/logo.png" />
  <br/>
  <b>Ngôn ngữ lập trình dành cho người Việt</b>
  <br/>
  <br/>
  <a href="https://github.com/nguyenphuminh/VNC/blob/master/LICENSE.md"><img src="https://img.shields.io/badge/license-MIT-blue.svg"/></a>
  <a href="https://github.com/nguyenphuminh/VNC/search?l=batchfile"><img alt="language" src="https://img.shields.io/badge/language-Batchfile-purple.svg"></a>
</div>

## What is VNC ?
VNC là ngôn ngữ lập trình được tạo ra dành cho người Việt với cấu trúc câu lệnh là những cụm từ tiếng Việt. VNC được tạo ra dựa trên mã nguồn của một ngôn ngữ khác (cũng là do tôi tạo) tên là <a href="https://github.com/nguyenphuminh/FreakC">"FreakC"</a>

## Hướng dẫn sử dụng trình biên dịch
Trong folder "VNC", mở "cmd" và gõ lệnh sau để dịch và chạy code:

    vnc file_name
    
Ví dụ:
    
    vnc Examples/HelloWorld.vnc
 
Nếu bạn chỉ muốn dịch code, gõ:

    vnc file_name --dich
    
Nếu bạn muốn dịch và hiển thị code đã được dịch, hãy gõ:

    vnc file_name --dichvadoc
    
Để hiện thông tin phiên bản, dùng:

    vnc --phienban

Cuối cùng là tạo một thư mục project VNC mới:

    vnc project_name --tao

<b>Trình biên dịch này chỉ hoạt động trên Windows.</b>

## Samples
<a href=https://github.com/nguyenphuminh/VNC/tree/master/Examples>Ấn vào đây để xem các ví dụ.</a>

## Convert VNC to .EXE files
Trong "vnc/utils/scripts", có file "battoexe.bat" với công dụng là chuyển đổi file .bat sang .exe.

Để chuyển từ .vnc sang .exe, bạn sẽ phải dịch code .vnc sang .bat bằng trình biên dịch, rồi kéo file .bat mới vào battoexe.bat để chuyển sang .exe.

Bạn có thể tìm trên mạng một số tool khác trên mạng để chuyển .bat sang .exe.

## Sublime Text
Để làm nổi bật code (thêm màu), copy folder "VNC" trong cùng thư mục trên, rồi paste vào "%APPDATA%\Sublime Text v\Packages\".

VNC được hỗ trợ lớn trong Sublime Text, nên bạn rất nên sử dụng Sublime Text để code VNC.

## Frameworks
Có khá nhiều framework trong folder "utils" mà bạn có thể sử dụng để làm phần mềm trở nên hữu dụng hơn. Trong tương lai, tôi sẽ cập nhật cách dùng cho các framework đó.

<b>Lưu ý: Tôi không sở hữu chúng.</b>

## Copyrights and License
Copyright © 2020 Nguyen Phu Minh

This language is licensed under the MIT License