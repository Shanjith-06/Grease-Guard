<?php
declare(strict_types=1);
if(session_status()!==PHP_SESSION_ACTIVE)session_start();
if(empty($_SESSION['csrf']))$_SESSION['csrf']=bin2hex(random_bytes(16));
require_once __DIR__.'/../config/database.php'; require_once __DIR__.'/../config/functions.php';
$flash=getFlash(); $current=basename($_SERVER['PHP_SELF']);
?>
<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title><?=h($pageTitle??'GreaseGuard')?> | GreaseGuard</title><link rel="stylesheet" href="css/style.css"></head><body>
<div class="shell"><aside class="side"><div class="brand"><b>GG</b><div><strong>GreaseGuard</strong><small>Kitchen Compliance</small></div></div>
<nav><a class="<?=$current==='index.php'?'active':''?>" href="index.php">Dashboard</a><a class="<?=in_array($current,['traps.php','add_trap.php','edit_trap.php'])?'active':''?>" href="traps.php">Grease Traps</a><a class="<?=in_array($current,['cleaning_records.php','add_cleaning.php'])?'active':''?>" href="cleaning_records.php">Cleaning Records</a></nav>
<div class="side-note"><strong>GreenLeaf Commercial Kitchen</strong><span>Simple cleaning schedule and record management.</span></div></aside>
<main><header class="top"><div><small>COMMERCIAL KITCHEN MANAGEMENT</small><h1><?=h($pageTitle??'GreaseGuard')?></h1></div><a class="btn primary" href="add_trap.php">+ Add Grease Trap</a></header>
<?php if($flash):?><div class="flash <?=$flash['type']?>"><?=h($flash['message'])?></div><?php endif;?>
