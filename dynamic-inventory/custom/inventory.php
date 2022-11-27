#!/usr/bin/php
<?php

/**
 * @file
 * Example custom dynamic inventory script for Ansible, in PHP.
 */

/**
 * Example inventory for testing.
 *
 * @return array
 *   An example inventory with two hosts.
 */
function example_inventory() {
  return [
    'group' => [
      'hosts' => ['192.168.56.71', '192.168.56.72'],
      'vars' => [
        'ansible_user' => 'vagrant',
        'ansible_ssh_private_key_file' => '~/.vagrant.d/insecure_private_key',
        'ansible_python_interpreter' => '/usr/bin/python3',
        'example_variable' => 'value',
      ],
    ],
    '_meta' => [
      'hostvars' => [
        '192.168.56.71' => [
          'host_specific_var' => 'foo',
        ],
        '192.168.56.72' => [
          'host_specific_var' => 'bar',
        ],
      ],
    ],
  ];
}

/**
 * Empty inventory for testing.
 *
 * @return array
 *   An empty inventory.
 */
function empty_inventory() {
  return ['_meta' => ['hostvars' => new stdClass()]];
}

/**
 * Get inventory.
 *
 * @param array $argv
 *   Array of command line arguments (as in $_SERVER['argv']).
 *
 * @return array
 *   Inventory of groups or vars, depending on arguments.
 */
function get_inventory($argv = []) {
  $inventory = new stdClass();

  // Called with `--list`.
  if (!empty($argv[1]) && $argv[1] == '--list') {
    $inventory = example_inventory();
  }
  // Called with `--host [hostname]`.
  elseif ((!empty($argv[1]) && $argv[1] == '--host') && !empty($argv[2])) {
    // Not implemented, since we return _meta info `--list`.
    $inventory = empty_inventory();
  }
  // If no groups or vars are present, return an empty inventory.
  else {
    $inventory = empty_inventory();
  }

  print json_encode($inventory);
}

// Get the inventory.
get_inventory($_SERVER['argv']);

?>
