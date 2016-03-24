<?php
// upload.php
// 'images' refers to your file input name attribute

if (empty($_FILES['images'])) {
    echo "file empty";
    return;
}

// get the files posted
$images = $_FILES['images'];

// a flag to see if everything is ok
$success = null;

// file paths to store
$paths= [];

// get file names
$filenames = $images['name'];

// loop and process files
for($i=0; $i < count($filenames); $i++){
    $ext = explode('.', basename($filenames[$i]));
    $target = "uploads" . DIRECTORY_SEPARATOR . md5(uniqid()) . "." . array_pop($ext);
    if(move_uploaded_file($images['tmp_name'][$i], $target)) {
        $success = true;
        $paths[] = $target;
    } else {
        $success = false;
        break;
    }
}

// check and process based on successful status 
if ($success === true) {
    $output = [];
} elseif ($success === false) {
    $output = ['Error while uploading images. Contact the system administrator'];
    // delete any uploaded files
    foreach ($paths as $file) {
        unlink($file);
    }
} else {
    $output = ['No files were processed.'];
}

// return a json encoded response for plugin to process successfully
echo json_encode($output);
