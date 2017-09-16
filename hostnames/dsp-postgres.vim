set guifont=Lucida_Console:h12:b:cDEFAULT

augroup run_commands

    autocmd!

    autocmd BufRead Job_Scheduler.py\|JS_Excel_Interface.py\|JS_GUI.pyw\|Data_Application.py :nnoremap <buffer> <S-F2> :!start C:\db_service_test\Applications\Utility_Workbook\Code_Eval\WinPython-64bit-3.4.3.5\WinPython Command Prompt.exe "python -i Z:\application_code\DB_Projects\Job_Scheduler\JS_GUI.pyw --sheet_name=Query --book_name=Job_Specifications_New_Template~2.xls --proj_dir=C:\db_service_test\Proj_Folder\mknopf\job_scheduler_v20\Phase_2"<CR>

    autocmd BufRead Update_Spreadsheet.pyw :nnoremap <buffer> <S-F2> :!start C:\db_service_test\Applications\Utility_Workbook\Code_Eval\WinPython-64bit-3.4.3.5\WinPython Command Prompt.exe "python -i Z:\application_code\DB_Projects\Update_Spreadsheet\Update_Spreadsheet.pyw --json=C:\db_service_test\Proj_Folder\mknopf\Phase_1\Specs\Update_Spreadsheet\spec_Update_Spreadsheet_All.json"<CR>

augroup END 

augroup abbreviations

    autocmd!
    autocmd BufRead Excel_Interface.*\|JS_Excel_Interface.py :ab <buffer> exc Excel_Interface
    autocmd BufRead Data_Application.* :ab <buffer> dat Data_Application
    autocmd BufRead */Data_Utils/* :ab <buffer> datu Data_Utils

augroup END
