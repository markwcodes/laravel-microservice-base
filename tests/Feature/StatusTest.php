<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Http\Response;

class StatusTest extends TestCase
{
    public function test_status_endpoint_returns_correct_metadata_structure()
    {
        $response = $this->getJson('/status');

        $response->assertStatus(Response::HTTP_OK);
        $response->assertJsonStructure([
            '*' => [[
                'description',
                'version',
                'sha',
            ]]
        ]);
    }

    public function test_root_endpoint_returns_successful_hello_world()
    {
        $response = $this->getJson('/');

        $response->assertStatus(Response::HTTP_OK);
        $response->assertJsonPath('message', 'Greetings, world!'); // <-- typo - test should fail
    }
}
