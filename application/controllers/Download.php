<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Create By : rochman@programmer.net
 */
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Download extends CI_Controller
{
    
    function __construct()
    {
        parent::__construct();
        $this->load->model('Mod_aplikasi');
    }

}