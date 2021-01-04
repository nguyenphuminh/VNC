@echo off
setlocal enabledelayedexpansion
if "%1" == "" (
	echo.
	echo.
	echo. Cach dung: vnc --{tuychon/ten} {tuychon}
	echo.
	echo.
	echo. Cac tuy chon:
	echo.
	echo.  phienban  :Phai la tham so thu nhat, hien phien ban.
	echo.  dich      :Phai la tham so thu hai, bien dich file.
	echo.  dichvadoc :Phai la tham so thu hai, dich va hien code duoc dich.
	echo.  tao       :Phai la tham so thu hai, tao mot project moi.
	echo.
	echo. De chong o {tuychon} neu muon bien dich va chay file cung luc.
	echo.
	echo.
	pause >nul
	exit /b
)
if "%1" == "--phienban" goto fcversion
if "%2" == "--dich" (
	set fccompile=true
) else if "%2" == "--dichvadoc" (
	set fcread=true
) else if "%2" == "--tao" (
	set fccreate=true
)
set fccompilename=%1
set a=%fccompilename:.vnc=%
if "%fccreate%" == "true" (
	md %a%
	cd %a%
	echo.>>%a%.bat
	exit /b
)
set fccomment=false
set wloopnum=0
set wloopnum2=0
echo @echo off>%a%.bat
echo :FreakCCompiled>>%a%.bat
echo set /a numpuke=%%random%% %%%% 99 + 1 >>%a%.bat
echo set /a numpoop=%%random%% %%%% 999 + 1 >>%a%.bat
echo set /a numpiss=%%random%% %%%% 9 + 1 >>%a%.bat
echo set /a numdiarrhea=%%random%% %%%% 9999 + 1 >>%a%.bat
echo set /a numbutt=%%random%% %%%% 99999 + 1 >>%a%.bat
for /f "tokens=* delims= " %%x in (%a%.vnc) do (
	set deniedToken=false
	set printString=%%x
	for %%a in (%%x) do (
		if "%%a" == "/*" (
			set fccomment=true
			set printString=!printString:/*=!
		)
		if "%%a" == "*/" (
			set fccomment=false
			set printString=!printString:*/=!
		)
		if "%%a" == "CTAN" (
			echo.>>%a%.bat
			set deniedToken=true
		)
		if %%a == Chen (
			type !printString:Chen =!>>%a%.bat
			set deniedToken=true
		)
		if %%a == KhaiBaoBoPhan (
			echo.>%a%.bat
			set deniedToken=true
		)
		if %%a == TruyCapO set printString=!printString:TruyCapO =!:
		if %%a == KiemTraVaInKetQua (
			set tmb=!printString:KiemTraVaInKetQua =!
			echo if !tmb! echo Dung>>%a%.bat
			echo if not !tmb! echo Sai>>%a%.bat
			set deniedToken=true
		)
		if %%a == KiemTra (
			set tmb=!printString:KiemTra =!
			echo if !tmb! set tmhres=Dung>>%a%.bat
			echo if not !tmb! set tmhres=Sai>>%a%.bat
			set deniedToken=true
		)
		if %%a == ThucHienVaInKetQua (
			set prob=!printString:ThucHienVaInKetQua =!
			echo set /a fusolved=!prob!>>%a%.bat
			echo echo %%fusolved%%>>%a%.bat
			set deniedToken=true
		)
		if %%a == ThucHien (
			set prob=!printString:ThucHien =!
			echo set /a fusolved=!prob!>>%a%.bat
			set deniedToken=true
		)
		if %%a == KiemTraChanLe (
			set /a num=!printString:~14! %% 2
			echo if !num! == 0 echo So chan^! >>%a%.bat
			echo if not !num! == 0 echo So le^! >>%a%.bat
			set deniedToken=true
		)
		if %%a == MuHai (
			set sqmb=!printString:MuHai =!
			echo set /a !sqmb!=%%!sqmb!%% * %%!sqmb!%%>>%a%.bat
			set deniedToken=true
		)
		if %%a == LapKhi (
			set fccondition=!printString:LapKhi =!
			echo :WhileLoop!wloopnum!>>%a%.bat
			echo if not !fccondition! goto EndLoop!wloopnum!>>%a%.bat
			set deniedToken=true
		)
		if %%a == NgungLap (
			echo goto WhileLoop!wloopnum!>>%a%.bat
			echo :EndLoop!wloopnum!>>%a%.bat
			set /a wloopnum=!wloopnum!+1
			set deniedToken=true
		)
		if %%a == LapLienTuc (
			echo :RepeatSuck!wloopnum!>>%a%.bat
			set deniedToken=true
		)
		if %%a == ChoToiKhi (
			set fccondition2=!printString:ChoToiKhi =!
			echo if not !fccondition2! goto RealStale!wloopnum2!>>%a%.bat
			echo goto RepeatSuck!wloopnum2!>>%a%.bat
			echo :RealStale!wloopnum2!>>%a%.bat
			set /a wloopnum2=!wloopnum2!+1
			set deniedToken=true
		)
		if %%a == MuBa (
			set sqmb=!printString:MuBa =!
			echo set /a !sqmb!=%%!sqmb!%% * %%!sqmb!%% * %%!sqmb!%%>>%a%.bat
			set deniedToken=true
		)
		if %%a == GoPhim set printString=!printString:GoPhim =CHOICE /C:! /N
		if %%a == InRa set printString=!printString:InRa=echo!
		if %%a == InRaDong set printString=!printString:InRaDong=echo.!
		if %%a == TaoThuMuc set printString=!printString:TaoThuMuc=md!
		if %%a == ChuyenVaoThuMuc set printString=!printString:ChuyenVaoThuMuc=cd!
		if %%a == XoaTapTin set printString=!printString:XoaTapTin=del!
		if %%a == XoaThuMuc set printString=!printString:XoaThuMuc=rmdir!
		if %%a == DocTapTin set printString=!printString:DocTapTin=type!
		if %%a == Tinh (
			set printString=!printString:Tinh=set /a!
			set printString=!printString:++=+=1!
			set printString=!printString:--=-=1!
		)
		if %%a == Dat set printString=!printString:Dat=set!
		if %%a == Nhap set printString=!printString:Nhap=set /p!
		if %%a == DiToi set printString=!printString:DiToi=goto!
		if %%a == GoiThuTuc set printString=!printString:GoiThuTuc=call!
		if %%a == GoiHam set printString=!printString:GoiHam =call :!
		if %%a == DoiMau set printString=!printString:DoiMau=color!
		if %%a == DoiKichCo set printString=!printString:DoiKichCo=mode!
		if %%a == DoiTieuDe set printString=!printString:DoiTieuDe=title!
		if %%a == DoiTenTapTin set printString=!printString:DoiTenTapTin=ren!
		if %%a == DiChuyenTapTin set printString=!printString:DiChuyenTapTin=move!
		if %%a == SaoChepTapTin set printString=!printString:SaoChepTapTin=copy!
		if %%a == MoTapTin set printString=!printString:MoTapTin=start!
		if %%a == Thoat set printString=!printString:thoat=exit!
		if %%a == LapChuongTrinh set printString=!printString:LapChuongTrinh=goto FreakCCompiled!
		if %%a == TatMay set printString=!printString:TatMay=shutdown -s -t 0!
		if %%a == KhoiDongLai set printString=!printString:KhoiDongLai=shutdown -r -t 0!
		if %%a == An set printString=!printString:An=cls!
		if %%a == TamDung set printString=!printString:TamDung=pause!
		if %%a == BatDauCucBo set printString=!printString:BatDauCucBo=SETLOCAL!
		if %%a == KetThucCucBo set printString=!printString:KetThucCucBo=ENDLOCAL!
		if %%a == XemNgay set printString=!printString:XemGio=date /t!
		if %%a == XemGio set printString=!printString:XemNgay=time /t!
		if %%a == DoiNgay set printString=!printString:DoiNgay=date!
		if %%a == DoiGio set printString=!printString:DoiGio=time!
		if %%a == XemMucVaTep set printString=!printString:XemMucVaTep=dir!
		if %%a == Neu set printString=!printString:Neu=if!
		if %%a == NeuPhim set printString=!printString:NeuPhim=if errorlevel!
		if %%a == NeuPhimKhongLa set printString=!printString:NeuPhimKhongLa=if not errorlevel!
		if %%a == NeuKhongPhai set printString=!printString:NeuKhong=if not!
		if %%a == NeuDaKhoiTao set printString=!printString:NeuDaKhoiTao=if defined!
		if %%a == NeuTonTai set printString=!printString:NeuTonTai=if exist!
		if %%a == NeuKhongTonTai set printString=!printString:NeuKhongTonTai=if not exist!
		if %%a == NeuChuaKhoiTao set printString=!printString:NeuChuaKhoiTao=if not defined!
		if %%a == KhongThi set printString=!printString:KhongThi=else!
		if %%a == Moc  set printString=!printString:Moc =:!
		if %%a == Cho set printString=!printString:Cho=timeout /nobreak /t!
		if %%a == HienCuaSoLenh set printString=!printString:HienCuaSoLenh=@echo on!
		if %%a == AnCuaSoLenh set printString=!printString:AnCuaSoLenh=@echo off!
		if %%a == VongLap set printString=!printString:VongLap=for /l!
		if %%a == QuetFile set printString=!printString:QuetFile=for /r!
		if %%a == QuetChuoi set printString=!printString:QuetChuoi=for /f!
		if %%a == QuetNoiDung set printString=!printString:QuetNoiDung=for!
		if %%a == QuetThuMuc set printString=!printString:QuetThuMuc=for /d!
		if %%a == GuiKetNoi set printString=!printString:GuiKetNoi=ping!
		if %%a == ThongTinMay set printString=!printString:ThongTinMay=systeminfo!
		if %%a == ThongTinIP set printString=!printString:ThongTinIP=ipconfig /all!
	)
	if "!fccomment!" == "false" (
		if not "!deniedToken!" == "true" echo. !printString!>>%a%.bat
	) else (
		echo. ::!printString!>>%a%.bat
	)
)
setlocal disabledelayedexpansion
if "%fcread%" == "true" type %a%.bat
if not "%fccompile%" == "true" if not "%fcread%" == "true" call %a%.bat
exit /b
:fcversion
echo VNC Phien Ban 0.1.0
exit /b