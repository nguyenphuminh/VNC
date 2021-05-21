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
	echo. De chong {tuychon} neu muon bien dich va chay file cung luc.
	echo.
	echo.
	pause >nul
	exit /b
)
set proctar=java
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
	echo.>>%a%.vnc
	exit /b
)
set fccomment=false
set wloopnum=0
set wloopnum2=0
echo @echo off>%a%.bat
echo :VNCCompiled>>%a%.bat
for /f "tokens=* delims= " %%x in (%a%.vnc) do (
	set deniedToken=false
	set printString=%%x
	for %%a in (%%x) do (
		if %%a == SuDungThuVien[] (
			set lib=!printString:SuDungThuVien[] =!
			if "!lib!" == "ThuVienThapPhan" (
				echo for /f %%%%i in ('powershell %%~2'^) DO set %%~1=%%%%i>fclib_float.bat
				set deniedToken=true
				set floatimp=true
			) else if "!lib!" == "ThuVienMang" (
				(
				echo set max=1
				echo for %%%%i in ^(%%~2^) DO (
				echo 	set max=%%%%i
				echo 	goto fcmaxend
				echo ^)
				echo :fcmaxend
				echo for %%%%i in (%%~2^) DO (
				echo 	if %%%%i GTR %%max%% (
				echo 		set max=%%%%i
				echo 	^)
				echo ^)
				echo set %%~1=%%max%%
				)>fclib_arrayfunc_max.bat
				(
				echo set min=1
				echo for %%%%i in ^(%%~2^) DO (
				echo 	set min=%%%%i
				echo 	goto fcminend
				echo ^)
				echo :fcminend
				echo for %%%%i in (%%~2^) DO (
				echo 	if %%%%i LSS %%min%% (
				echo 		set min=%%%%i
				echo 	^)
				echo ^)
				echo set %%~1=%%min%%
				)>fclib_arrayfunc_min.bat
				(
				echo set sum=0
				echo for %%%%i in ^(%%~2^) DO set /a sum+=%%%%i
				echo set %%~1=%%sum%%
				)>fclib_arrayfunc_sum.bat
				set deniedToken=true
			) else if "!lib!" == "ThuVienToanHoc" (
				(
				echo set tar=%%~2
				echo set %%~1=%%tar:-=%%
				)>fclib_math_abs.bat
				(
				echo set /a res=%%~2 %%%% 2
				echo if %%res%% == 0 (
				echo 	set %%~1=true
				echo ^) else (
				echo 	set %%~1=false
				echo ^)
				)>fclib_math_even.bat
				(
				echo set /a res=%%~2 %%%% 2
				echo if %%res%% == 0 (
				echo 	set %%~1=false
				echo ^) else (
				echo 	set %%~1=true
				echo ^)
				)>fclib_math_odd.bat
				(
				echo set res=%%~2
				echo set /a t=%%~3 - 1
				echo for /l %%%%i in (1,1,%%t%%^) do (
				echo 	set /a res*=%%res%%
				echo ^)
				echo set %%~1=%%res%%
				)>fclib_math_pow.bat
				(
				echo set num1=0
				echo set num2=1
				echo set num3=0
				echo set str=1
				echo set i=0
 				echo set /a end=%%~2 - 1
				echo :loop
				echo if not %%i%% LSS %%end%% goto end
 				echo set /a num3=%%num1%% + %%num2%%
 				echo set str=%%str%% %%num3%%
 				echo set /a num1=%%num2%%
 				echo set /a num2=%%num3%%
 				echo set /a i+=1
				echo goto loop
				echo :end
				echo set %%~1=%%str%%
				)>fclib_math_fibseq.bat
				(
				echo set num1=0
				echo set num2=1
				echo set num3=0
				echo set i=0
 				echo set /a end=%%~2 - 1
				echo :loop
				echo if not %%i%% LSS %%end%% goto end
 				echo set /a num3=%%num1%% + %%num2%%
 				echo set /a num1=%%num2%%
 				echo set /a num2=%%num3%%
 				echo set /a i+=1
				echo goto loop
				echo :end
				echo set %%~1=%%num3%%
				)>fclib_math_fib.bat
				set deniedToken=true
				(
				echo set mul=1
				echo for /l %%%%i in (1,1,%%~2^) do set /a mul*=%%%%i
				echo set %%~1=%%mul%%
				)>fclib_math_fact.bat
			) else if "!lib!" == "ThuVienChuoi" (
				(
				echo set lower=%%~2
				echo set lower=%%lower:A=a%%
				echo set lower=%%lower:B=b%%
				echo set lower=%%lower:C=c%%
				echo set lower=%%lower:D=d%%
				echo set lower=%%lower:E=e%%
				echo set lower=%%lower:F=f%%
				echo set lower=%%lower:G=g%%
				echo set lower=%%lower:H=h%%
				echo set lower=%%lower:I=i%%
				echo set lower=%%lower:J=j%%
				echo set lower=%%lower:K=k%%
				echo set lower=%%lower:L=l%%
				echo set lower=%%lower:M=m%%
				echo set lower=%%lower:N=n%%
				echo set lower=%%lower:O=o%%
				echo set lower=%%lower:P=p%%
				echo set lower=%%lower:Q=q%%
				echo set lower=%%lower:R=r%%
				echo set lower=%%lower:S=s%%
				echo set lower=%%lower:T=t%%
				echo set lower=%%lower:U=u%%
				echo set lower=%%lower:V=v%%
				echo set lower=%%lower:W=w%%
				echo set lower=%%lower:X=x%%
				echo set lower=%%lower:Y=y%%
				echo set lower=%%lower:Z=z%%
				echo set %%~1=%%lower%%
				)>fclib_string_lower.bat
				(
				echo set upper=%%~2
				echo set upper=%%upper:a=A%%
				echo set upper=%%upper:b=B%%
				echo set upper=%%upper:c=C%%
				echo set upper=%%upper:d=D%%
				echo set upper=%%upper:e=E%%
				echo set upper=%%upper:f=F%%
				echo set upper=%%upper:g=G%%
				echo set upper=%%upper:h=H%%
				echo set upper=%%upper:i=I%%
				echo set upper=%%upper:j=J%%
				echo set upper=%%upper:k=K%%
				echo set upper=%%upper:l=L%%
				echo set upper=%%upper:m=M%%
				echo set upper=%%upper:n=N%%
				echo set upper=%%upper:o=O%%
				echo set upper=%%upper:p=P%%
				echo set upper=%%upper:q=Q%%
				echo set upper=%%upper:r=R%%
				echo set upper=%%upper:s=S%%
				echo set upper=%%upper:t=T%%
				echo set upper=%%upper:u=U%%
				echo set upper=%%upper:v=V%%
				echo set upper=%%upper:w=W%%
				echo set upper=%%upper:x=X%%
				echo set upper=%%upper:y=Y%%
				echo set upper=%%upper:z=Z%%
				echo set %%~1=%%upper%%
				)>fclib_string_upper.bat
				(
				echo setlocal enabledelayedexpansion
				echo set len=0
				echo set str=%%~2
				echo :loop
				echo if not "^!str:^~%%len%%^!" == "" set /a len+=1 ^& goto loop
				echo (endlocal ^& set %%~1=%%len%%^)
				)>fclib_string_length.bat
				(
				echo setlocal enabledelayedexpansion
				echo set len=0
				echo set str=%%~2
				echo set newstr=
				echo :loop
				echo if not "^!str:^~%%len%%^!" == "" set /a len+=1 ^& goto loop
				echo set /a strlen=%%len%%-1
				echo for /l %%%%i in (%%strlen%%,-1,0^) do set newstr=^^!newstr^^!^^!str:^~%%%%i,1^^!
				echo (endlocal ^& set %%~1=%%newstr%%^)
				)>fclib_string_reverse.bat
				set deniedToken=true
			) else (
				set deniedToken=true
			)
		)
		if %%a == DaoChuoi[] set printString=!printString:DaoChuoi[]=call fclib_string_reverse.bat!
		if %%a == GiaiThua[] set printString=!printString:GiaiThua[]=call fclib_math_fact.bat!
		if %%a == DoDaiChuoi[] set printString=!printString:DoDaiChuoi[]=call fclib_string_length.bat!
		if %%a == InHoa[] set printString=!printString:InHoa[]=call fclib_string_upper.bat!
		if %%a == InThuong[] set printString=!printString:InThuong[]=call fclib_string_lower.bat!
		if %%a == DayFibonacci[] set printString=!printString:DayFibonacci[]=call fclib_math_fibseq.bat!
		if %%a == Fibonacci[] set printString=!printString:Fibonacci[]=call fclib_math_fib.bat!
		if %%a == KiemTraLe[] set printString=!printString:KiemTraLe[]=call fclib_math_odd.bat!
		if %%a == KiemTraChan[] set printString=!printString:KiemTraChan[]=call fclib_math_even.bat!
		if %%a == Mu[] set printString=!printString:Mu[]=call fclib_math_pow.bat!
		if %%a == GiaTriTuyetDoi[] set printString=!printString:GiaTriTuyetDoi[]=call fclib_math_abs.bat!
		if %%a == SoLonNhatCuaDay[] set printString=!printString:SoLonNhatCuaDay[]=call fclib_arrayfunc_max.bat!
		if %%a == SoNhoNhatCuaDay[] set printString=!printString:SoNhoNhatCuaDay[]=call fclib_arrayfunc_min.bat!
		if %%a == TongSoHangCuaDay[] set printString=!printString:TongSoHangCuaDay[]= call fclib_arrayfunc_sum.bat!
		if %%a == TaoHam[] (
			set procval=0
			set procadd=true
			set proctar=!printString:TaoHam[] =!
			set deniedToken=true
		)
		if %%a == DongHam[] (
			set procadd=false
			set proctar=none
			set deniedToken=true
		)
		if "%%a" == "/*" (
			set fccomment=true
			set printString=!printString:/*=!
		)
		if "%%a" == "*/" (
			set fccomment=false
			set printString=!printString:*/=!
		)
		if "%%a" == "CTAN" (
			if "!procadd!" == "true" (
				echo.>>!proctar!.bat
			) else (
				echo.>>%a%.bat
			)
			set deniedToken=true
		)
		if %%a == Chen[] (
			type !printString:Chen[] =!>>%a%.bat
			set deniedToken=true
		)
		if %%a == KhaiBaoBoPhan[] (
			echo.>%a%.bat
			set deniedToken=true
		)
		if %%a == TruyCapO[] set printString=!printString:TruyCapO[] =!:
		if %%a == KiemTraVaInKetQua[] (
			if "!procadd!" == "true" (
				set outtar=!proctar!.bat
			) else (
				set outtar=%a%.bat
			)
			set tmb=!printString:KiemTraVaInKetQua[] =!
			echo if !tmb! echo Dung>>!outtar!
			echo if not !tmb! echo Sai>>!outtar!
			set deniedToken=true
		)
		if %%a == KiemTra[] (
			if "!procadd!" == "true" (
				set outtar=!proctar!.bat
			) else (
				set outtar=%a%.bat
			)
			set tmb=!printString:KiemTra[] =!
			echo if !tmb! set tmhres=Dung>>!outtar!
			echo if not !tmb! set tmhres=Sai>>!outtar!
			set deniedToken=true
		)
		if %%a == ThucHienVaInKetQua[] (
			if "!procadd!" == "true" (
				set outtar=!proctar!.bat
			) else (
				set outtar=%a%.bat
			)
			set prob=!printString:ThucHienVaInKetQua[] =!
			echo set /a fusolved=!prob!>>!outtar!
			echo echo %%fusolved%%>>!outtar!
			set deniedToken=true
		)
		if %%a == ThucHien[] (
			if "!procadd!" == "true" (
				set outtar=!proctar!.bat
			) else (
				set outtar=%a%.bat
			)
			set prob=!printString:ThucHien[] =!
			echo set /a fusolved=!prob!>>!outtar!
			set deniedToken=true
		)
		if %%a == LapKhi[] (
			if "!procadd!" == "true" (
				set outtar=!proctar!.bat
			) else (
				set outtar=%a%.bat
			)
			set fccondition=!printString:LapKhi[] =!
			echo :WhileLoop!wloopnum!>>!outtar!
			echo if not !fccondition! goto EndLoop!wloopnum!>>!outtar!
			set deniedToken=true
		)
		if %%a == NgungLap[] (
			if "!procadd!" == "true" (
				set outtar=!proctar!.bat
			) else (
				set outtar=%a%.bat
			)
			echo goto WhileLoop!wloopnum!>>!outtar!
			echo :EndLoop!wloopnum!>>!outtar!
			set /a wloopnum=!wloopnum!+1
			set deniedToken=true
		)
		if %%a == LapLienTuc[] (
			if "!procadd!" == "true" (
				set outtar=!proctar!.bat
			) else (
				set outtar=%a%.bat
			)
			echo :RepeatSuck!wloopnum!>>!outtar!
			set deniedToken=true
		)
		if %%a == ChoToiKhi[] (
			if "!procadd!" == "true" (
				set outtar=!proctar!.bat
			) else (
				set outtar=%a%.bat
			)
			set fccondition2=!printString:ChoToiKhi[] =!
			echo if not !fccondition2! goto RealStale!wloopnum2!>>!outtar!
			echo goto RepeatSuck!wloopnum2!>>!outtar!
			echo :RealStale!wloopnum2!>>!outtar!
			set /a wloopnum2=!wloopnum2!+1
			set deniedToken=true
		)
		if %%a == GoPhim[] set printString=!printString:GoPhim[] =CHOICE /C:! /N
		if %%a == InRa[] set printString=!printString:InRa[]=echo!
		if %%a == InRaDong[] set printString=!printString:InRaDong[]=echo.!
		if %%a == TaoThuMuc[] set printString=!printString:TaoThuMuc[]=md!
		if %%a == ChuyenVaoThuMuc[] set printString=!printString:ChuyenVaoThuMuc[]=cd!
		if %%a == XoaTapTin[] set printString=!printString:XoaTapTin[]=del!
		if %%a == XoaThuMuc[] set printString=!printString:XoaThuMuc[]=rmdir!
		if %%a == DocTapTin[] set printString=!printString:DocTapTin[]=type!
		if %%a == Tinh[] (
			set printString=!printString:Tinh[]=set /a!
			set printString=!printString:++=+=1!
			set printString=!printString:--=-=1!
		)
		if %%a == ThapPhan[] set printString=!printString:ThapPhan[]=call fclib_float.bat!
		if %%a == Dat[] set printString=!printString:Dat[]=set!
		if %%a == Nhap[] set printString=!printString:Nhap[]=set /p!
		if %%a == DiToi[] set printString=!printString:DiToi[]=goto!
		if %%a == GoiThuTuc[] set printString=!printString:GoiThuTuc[]=call!
		if %%a == GoiHam[] set printString=!printString:GoiHam[] =call :!
		if %%a == DoiMau[] set printString=!printString:DoiMau[]=color!
		if %%a == DoiKichCo[] set printString=!printString:DoiKichCo[]=mode!
		if %%a == DoiTieuDe[] set printString=!printString:DoiTieuDe[]=title!
		if %%a == DoiTenTapTin[] set printString=!printString:DoiTenTapTin[]=ren!
		if %%a == DiChuyenTapTin[] set printString=!printString:DiChuyenTapTin[]=move!
		if %%a == SaoChepTapTin[] set printString=!printString:SaoChepTapTin[]=copy!
		if %%a == MoTapTin[] set printString=!printString:MoTapTin[]=start!
		if %%a == Thoat[] set printString=!printString:Thoat[]=exit!
		if %%a == LapChuongTrinh[] set printString=!printString:LapChuongTrinh[]=goto VNCCompiled!
		if %%a == TatMay[] set printString=!printString:TatMay[]=shutdown -s -t 0!
		if %%a == KhoiDongLai[] set printString=!printString:KhoiDongLai[]=shutdown -r -t 0!
		if %%a == An[] set printString=!printString:An[]=cls!
		if %%a == TamDung[] set printString=!printString:TamDung[]=pause!
		if %%a == BatDauCucBo[] set printString=!printString:BatDauCucBo[]=SETLOCAL!
		if %%a == KetThucCucBo[] set printString=!printString:KetThucCucBo[]=ENDLOCAL!
		if %%a == XemNgay[] set printString=!printString:XemGio[]=date /t!
		if %%a == XemGio[] set printString=!printString:XemNgay[]=time /t!
		if %%a == DoiNgay[] set printString=!printString:DoiNgay[]=date!
		if %%a == DoiGio[] set printString=!printString:DoiGio[]=time!
		if %%a == XemMucVaTep[] set printString=!printString:XemMucVaTep[]=dir!
		if %%a == Neu[] set printString=!printString:Neu[]=if!
		if %%a == NeuPhim[] set printString=!printString:NeuPhim[]=if errorlevel!
		if %%a == NeuPhimKhongLa[] set printString=!printString:NeuPhimKhongLa[]=if not errorlevel!
		if %%a == NeuKhongPhai[] set printString=!printString:NeuKhong[]=if not!
		if %%a == NeuDaKhoiTao[] set printString=!printString:NeuDaKhoiTao[]=if defined!
		if %%a == NeuTonTai[] set printString=!printString:NeuTonTai[]=if exist!
		if %%a == NeuKhongTonTai[] set printString=!printString:NeuKhongTonTai[]=if not exist!
		if %%a == NeuChuaKhoiTao[] set printString=!printString:NeuChuaKhoiTao[]=if not defined!
		if %%a == KhongThi[] set printString=!printString:KhongThi[]=else!
		if %%a == Moc[]  set printString=!printString:Moc[] =:!
		if %%a == Cho[] set printString=!printString:Cho[]=timeout /nobreak /t!
		if %%a == HienCuaSoLenh[] set printString=!printString:HienCuaSoLenh[]=@echo on!
		if %%a == AnCuaSoLenh[] set printString=!printString:AnCuaSoLenh[]=@echo off!
		if %%a == VongLap[] set printString=!printString:VongLap[]=for /l!
		if %%a == QuetFile[] set printString=!printString:QuetFile[]=for /r!
		if %%a == QuetChuoi[] set printString=!printString:QuetChuoi[]=for /f!
		if %%a == QuetNoiDung[] set printString=!printString:QuetNoiDung[]=for!
		if %%a == QuetThuMuc[] set printString=!printString:QuetThuMuc[]=for /d!
		if %%a == GuiKetNoi[] set printString=!printString:GuiKetNoi[]=ping!
		if %%a == ThongTinMay[] set printString=!printString:ThongTinMay[]=systeminfo!
		if %%a == ThongTinIP[] set printString=!printString:ThongTinIP[]=ipconfig /all!
		if %%a == ChapNhanUnicode[] set printString=!printString:ChapNhanUnicode[]=chcp 65001!
	)
	if "!procadd!" == "true" (
		if !procval! == 0 (
			set procval=1
			echo.>!proctar!.bat
		) else (
			if not "!deniedToken!" == "true" echo. !printString!>>!proctar!.bat
		)
	)
	if "!fccomment!" == "false" (
		if not "!procadd!" == "true" if not "!deniedToken!" == "true" echo. !printString!>>%a%.bat
	) else (
		if not "!procadd!" == "true" echo. ::!printString!>>%a%.bat
	)
)
setlocal disabledelayedexpansion
if "%fcread%" == "true" type %a%.bat
if not "%fccompile%" == "true" if not "%fcread%" == "true" call %a%.bat
exit /b
:fcversion
echo VNC Phien Ban 0.1.0
exit /b