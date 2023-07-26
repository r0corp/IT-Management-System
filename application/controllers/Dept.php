<?php
defined('BASEPATH') or exit('No direct script access allowed');
/**
 * Create By : rochman@programmer.net
 */
class Dept extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model(array('Mod_dept'));
    }

    public function index()
    {
        $this->load->helper('url');
        $this->template->load('layoutbackend', 'office/dept');
    }

    public function ajax_list()
    {
        ini_set('memory_limit', '512M');
        set_time_limit(3600);
        $list = $this->Mod_dept->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $pel) {
            $no++;
            $row = array();
            $row[] = $pel->id_dept; //array 0
            $row[] = $pel->nama_dept; //array 1
            $row[] = $pel->id_dept; //array 2
            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->Mod_dept->count_all(),
            "recordsFiltered" => $this->Mod_dept->count_filtered(),
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
            'nama_dept'            => $this->input->post('nama_dept')
        );
        $this->Mod_dept->insert_dept("dept", $save);
        echo json_encode(array("status" => TRUE));
    }

    public function update()
    {
        $this->_validate();
        $id      = $this->input->post('id');
        $save  = array(
            'nama_dept' => $this->input->post('nama_dept')
        );
        $this->Mod_dept->update_dept($id, $save);
        echo json_encode(array("status" => TRUE));
    }

    public function edit_dept($id)
    {
        $data = $this->Mod_dept->get_dept($id);
        echo json_encode($data);
    }

    public function delete()
    {
        $id = $this->input->post('id');
        $this->Mod_dept->delete_dept($id, 'dept');
        echo json_encode(array("status" => TRUE));
    }
    private function _validate()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if ($this->input->post('nama_dept') == '') {
            $data['inputerror'][] = 'nama_dept';
            $data['error_string'][] = 'Type Name Cant Be Empty';
            $data['status'] = FALSE;
        }

        if ($data['status'] === FALSE) {
            echo json_encode($data);
            exit();
        }
    }
}
