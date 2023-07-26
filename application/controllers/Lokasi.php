<?php
defined('BASEPATH') or exit('No direct script access allowed');
/**
 * Create By : rochman@programmer.net
 */
class Lokasi extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model(array('Mod_lokasi'));
    }

    public function index()
    {
        $this->load->helper('url');
        $this->template->load('layoutbackend', 'office/lokasi');
    }

    public function ajax_list()
    {
        ini_set('memory_limit', '512M');
        set_time_limit(3600);
        $list = $this->Mod_lokasi->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $pel) {
            $no++;
            $row = array();
            $row[] = $pel->id_lokasi; //array 0
            $row[] = $pel->nama_lokasi; //array 1
            $row[] = $pel->id_lokasi; //array 2
            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->Mod_lokasi->count_all(),
            "recordsFiltered" => $this->Mod_lokasi->count_filtered(),
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
            'nama_lokasi'            => $this->input->post('nama_lokasi')
        );
        $this->Mod_lokasi->insert_lokasi("lokasi", $save);
        echo json_encode(array("status" => TRUE));
    }

    public function update()
    {
        $this->_validate();
        $id      = $this->input->post('id');
        $save  = array(
            'nama_lokasi' => $this->input->post('nama_lokasi')
        );
        $this->Mod_lokasi->update_lokasi($id, $save);
        echo json_encode(array("status" => TRUE));
    }

    public function edit_lokasi($id)
    {
        $data = $this->Mod_lokasi->get_lokasi($id);
        echo json_encode($data);
    }

    public function delete()
    {
        $id = $this->input->post('id');
        $this->Mod_lokasi->delete_lokasi($id, 'lokasi');
        echo json_encode(array("status" => TRUE));
    }
    private function _validate()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if ($this->input->post('nama_lokasi') == '') {
            $data['inputerror'][] = 'nama_lokasi';
            $data['error_string'][] = 'Type Name Cant Be Empty';
            $data['status'] = FALSE;
        }

        if ($data['status'] === FALSE) {
            echo json_encode($data);
            exit();
        }
    }
}
