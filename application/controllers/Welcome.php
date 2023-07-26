<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Create By : rochman@programmer.net
 */
class Welcome extends CI_Controller {
  public function index()
 {
  $this->load->view('welcome_message');
 }
}
?>