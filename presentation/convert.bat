for %%X in (*.ipe) do ( 
     call :do_conversion "%%X"
)
del *.aux
del *.log
GOTO:eof

:do_conversion
"C:\Program Files\ipe-7.0.10\bin\ipetoipe.exe" -pdf %1 "input.pdf"
pdflatex -quiet "convert.tex"
::move /y "input.pdf" "%~n1 nofix.pdf"
move /y "convert.pdf" "%~n1.pdf" 
del input.pdf
GOTO:eof