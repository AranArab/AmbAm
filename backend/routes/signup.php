<?php

$app->get('/api/signup', function ($request, $response, $args) {  //GET example

$pdo =$this->pdo;
$selectStatement = $pdo->select()
                        ->from('Person');
$stmt = $selectStatement->execute();
$contacts= $stmt->fetchAll();

$res['success'] = true;
$res['data'] = $Person;
$response->write(json_encode($res));
$pdo = null;
return $response;
});

// demo of insert
$app->post('/api/signup', function ($request, $response, $args) { //POST example

    $pdo =$this->pdo;
    $params = $request->getParsedBody();
    $Person_fname = $params['Person_fname'];
    $Person_lname = $params['Person_lname'];
    $phone_number = $params['phone_number'];
    $Email = $params['Email'];
    $Username = $params['Username'];
    $P_word = $params['P_word'];
    $Diet = $params['Diet'];

    $insertStatement = $pdo->insert(array( 'Person_fname', 'Person_lname', 'phone_number', 'Email', 'Username', 'P_word', 'Diet' ))
                                ->into('Person')
                                ->values(array($Person_fname, $Person_lname, $phone_number, $Email, $Username, $P_word, $Diet));
    $insert =  $insertStatement->execute();

    $res['success'] = "success"; // id of the record
    $response->write(json_encode($res));
    $pdo = null;
    return $response;
});
?>