<?php
defined('BASEPATH') or exit('No direct script access allowed');
/**
 * Create By : rochman@programmer.net
 */

class Subdivisi extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Mod_subdivisi');
    }

    public function index()
    {
        $this->load->helper('url');
        $data['sub']        = $this->Mod_subdivisi->getAll();
        $data['sub_level']  = $this->Mod_subdivisi->sublevel();
        $this->template->load('layoutbackend', 'office/subdivisi', $data);
    }

    public function ajax_list()
    {
        ini_set('memory_limit', '512M');
        set_time_limit(3600);
        $list = $this->Mod_subdivisi->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $sub) {
            $no++;
            $row = array();
            $row[]  = $sub->id_divisi;
            $row[]  = $sub->nama_divisi;
            $row[]  = $sub->id_subdivisi;
            $row[]  = $sub->nama_subdivisi;
            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->Mod_subdivisi->count_all(),
            "recordsFiltered" => $this->Mod_subdivisi->count_filtered(),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
    }

    public function insert()
    {
        $this->_validate();
        $save  = array(
            'id_divisi'         => $this->input->post('level'),
            'nama_subdivisi'    => $this->input->post('nama_subdivisi')

        );
        $this->Mod_subdivisi->insert_subdivisi("subdivisi", $save);
        echo json_encode(array("status" => TRUE));
    }

    public function editsub($id)
    {
        $data = $this->Mod_subdivisi->get_subdivisi($id);
        echo json_encode($data);
    }

    public function update()
    {
        $this->_validate();
        $id         = $this->input->post('id');
        $save       = array(
            'id_divisi'         => $this->input->post('level'),
            'nama_subdivisi'    => $this->input->post('nama_subdivisi')
            // 'nama_divisi'    => $this->input->post('nama_divisi')
        );
        $this->Mod_subdivisi->update_subdivisi($id, $save);
        echo json_encode(array("status" => TRUE));
    }

    public function delete()
    {
        $id = $this->input->post('id');
        $this->Mod_subdivisi->delete_subdivisi($id, 'subdivisi');
        echo json_encode(array("status" => TRUE));
    }

    private function _validate()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        // if ($this->input->post('nama_divisi') == '') {
        //     $data['inputerror'][] = 'nama_divisi';
        //     $data['error_string'][] = 'Division is required';
        //     $data['status'] = FALSE;
        // }

        if ($this->input->post('nama_subdivisi') == '') {
            $data['inputerror'][] = 'nama_subdivisi';
            $data['error_string'][] = 'Sub Division is required';
            $data['status'] = FALSE;
        }

        if ($this->input->post('level') == '') {
            $data['inputerror'][] = 'level';
            $data['error_string'][] = 'Please select is Division';
            $data['status'] = FALSE;
        }

        if ($data['status'] === FALSE) {
            echo json_encode($data);
            exit();
        }
    }
}
