<?php


$query = $db->execute("select * from `addins` order by `position`, `order`");
$test = $query->fetchrow();
$test1 = $test['addin'];

	if ($handle = opendir('../addins')) 
	{
   		while (false !== ($file = readdir($handle)))
		{
        	if ($file != "." && $file != "..")
			{
$available = array_diff($file, $test1); 
echo $available;
			}
			}
			closedir($handle);

		}
	

    
?>