<?php
defined('BASEPATH') or exit('No direct script access allowed');
/**
 * Create By : rochman@programmer.net
 */
class Merek extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model(array('Mod_merek'));
    }

    public function index()
    {
        $this->load->helper('url');
        $this->template->load('layoutbackend', 'aset/merek');
    }

    public function ajax_list()
    {
        ini_set('memory_limit', '512M');
        set_time_limit(3600);
        $list = $this->Mod_merek->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $pel) {
            $no++;
            $row = array();
            $row[] = $pel->id_merek; //array 0
            $row[] = $pel->nama_merek; //array 1
            $row[] = $pel->id_merek; //array 2
            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->Mod_merek->count_all(),
            "recordsFiltered" => $this->Mod_merek->count_filtered(),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
    }

    public function insert()
    {
        $this->_validate();
        // $kode = date('ymsi');
        $save  = array(
            'nama_merek'            => $this->input->post('nama_merek')
        );
        $this->Mod_merek->insert_merek("merek", $save);
        echo json_encode(array("status" => TRUE));
    }

    public function update()
    {
        $this->_validate();
        $id      = $this->input->post('id');
        $save  = array(
            'nama_merek' => $this->input->post('nama_merek')
        );
        $this->Mod_merek->update_merek($id, $save);
        echo json_encode(array("status" => TRUE));
    }

    public function edit_merek($id)
    {
        $data = $this->Mod_merek->get_merek($id);
        echo json_encode($data);
    }

    public function delete()
    {
        $id = $this->input->post('id');
        $this->Mod_merek->delete_merek($id, 'merek');
        echo json_encode(array("status" => TRUE));
    }
    private function _validate()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if ($this->input->post('nama_merek') == '') {
            $data['inputerror'][] = 'nama_merek';
            $data['error_string'][] = 'Type Name Cant Be Empty';
            $data['status'] = FALSE;
        }

        if ($data['status'] === FALSE) {
            echo json_encode($data);
            exit();
        }
    }
}
