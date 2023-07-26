<?php
defined('BASEPATH') or exit('No direct script access allowed');
/**
 * Create By : rochman@programmer.net
 */
class Tipe extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model(array('Mod_tipe'));
    }

    public function index()
    {
        $this->load->helper('url');
        $this->template->load('layoutbackend', 'aset/tipe');
    }

    public function ajax_list()
    {
        ini_set('memory_limit', '512M');
        set_time_limit(3600);
        $list = $this->Mod_tipe->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $pel) {
            $no++;
            $row = array();
            $row[] = $pel->id_tipe; //array 0
            $row[] = $pel->nama_tipe; //array 1
            $row[] = $pel->id_tipe; //array 2
            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->Mod_tipe->count_all(),
            "recordsFiltered" => $this->Mod_tipe->count_filtered(),
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
            'nama_tipe'            => $this->input->post('nama_tipe')
        );
        $this->Mod_tipe->insert_tipe("tipe", $save);
        echo json_encode(array("status" => TRUE));
    }

    public function update()
    {
        $this->_validate();
        $id      = $this->input->post('id');
        $save  = array(
            'nama_tipe' => $this->input->post('nama_tipe')
        );
        $this->Mod_tipe->update_tipe($id, $save);
        echo json_encode(array("status" => TRUE));
    }

    public function edit_tipe($id)
    {
        $data = $this->Mod_tipe->get_tipe($id);
        echo json_encode($data);
    }

    public function delete()
    {
        $id = $this->input->post('id');
        $this->Mod_tipe->delete_tipe($id, 'tipe');
        echo json_encode(array("status" => TRUE));
    }
    private function _validate()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if ($this->input->post('nama_tipe') == '') {
            $data['inputerror'][] = 'nama_tipe';
            $data['error_string'][] = 'Type Name Cant Be Empty';
            $data['status'] = FALSE;
        }

        if ($data['status'] === FALSE) {
            echo json_encode($data);
            exit();
        }
    }
}
