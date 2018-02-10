﻿;   Description: MessageRequester with icon
;            OS: Mac
; English-Forum: http://www.purebasic.fr/english/viewtopic.php?p=410009#p410009
;  French-Forum: 
;  German-Forum: 
; -----------------------------------------------------------------------------

; MIT License
; 
; Copyright (c) 2013 Shardik, wilbert
; 
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
; 
; The above copyright notice and this permission notice shall be included in all
; copies or substantial portions of the Software.
; 
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.

CompilerIf #PB_Compiler_OS<>#PB_OS_MacOS
  CompilerError "MacOs only!"
CompilerEndIf
EnableExplicit

Global Workspace.i = CocoaMessage(0, 0, "NSWorkspace sharedWorkspace")

Procedure MessageRequesterEx(Title.s, Info.s, Type.s)
  Protected Alert.i = CocoaMessage(0, CocoaMessage(0, 0, "NSAlert new"), "autorelease")
  CocoaMessage(0, Alert, "setMessageText:$", @Title)
  CocoaMessage(0, Alert, "setInformativeText:$", @Info)
  CocoaMessage(0, Alert, "setIcon:", CocoaMessage(0, Workspace, "iconForFileType:$", @Type))
  CocoaMessage(0, Alert, "runModal")
EndProcedure
;-Example
CompilerIf #PB_Compiler_IsMainFile  
  MessageRequesterEx("Icon demo 1", "Requester with app icon", "'APPL'")
  MessageRequesterEx("Icon demo 2", "Requester with caution icon", "'caut'")
  MessageRequesterEx("Icon demo 3", "Requester with note icon", "'note'")
  MessageRequesterEx("Icon demo 4", "Requester with stop icon", "'stop'")
CompilerEndIf
