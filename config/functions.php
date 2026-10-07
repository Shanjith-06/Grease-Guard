<?php
declare(strict_types=1);
function h(?string $v):string{return htmlspecialchars($v??'',ENT_QUOTES,'UTF-8');}
function nextCleaningDate(string $last,int $interval):string{$d=new DateTime($last);$d->modify("+{$interval} days");return $d->format('Y-m-d');}
function trapStatus(string $next):string{$t=new DateTime('today');$n=new DateTime($next);$days=(int)$t->diff($n)->format('%r%a');return $days<0?'OVERDUE':($days<=7?'DUE SOON':'UP TO DATE');}
function statusClass(string $s):string{return $s==='OVERDUE'?'status-overdue':($s==='DUE SOON'?'status-due':'status-ok');}
function flash(string $type,string $msg):void{$_SESSION['flash']=['type'=>$type,'message'=>$msg];}
function getFlash():?array{$x=$_SESSION['flash']??null;unset($_SESSION['flash']);return $x;}
