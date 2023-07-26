<?php
defined('BASEPATH') or exit('No direct script access allowed');
/**
 * Create By : rochman@programmer.net
 */
class Departement extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model(array('Mod_departement'));
    }

    public function index()
    {
        $this->load->helper('url');
        $this->template->load('layoutbackend', 'office/departement');
    }

    public function ajax_list()
    {
        ini_set('memory_limit', '512M');
        set_time_limit(3600);
        $list = $this->Mod_departement->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $pel) {
            $no++;
            $row = array();
            $row[] = $pel->id;
            $row[] = $pel->nama_divisi;
            $data[] = $row;
        }

        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->Mod_departement->count_all(),
            "recordsFiltered" => $this->Mod_departement->count_filtered(),
            "data" => $data,
        );
        //output to json format
        echo json_encode($output);
    }

    public function insert()
    {
        $this->_validate();
        // $date = date("Y-m-d H:i:s");
        $save  = array(
            'nama_divisi'   => $this->input->post('nama_divisi')
        );
        $this->Mod_departement->insert_departement("aset_divisi", $save);
        echo json_encode(array("status" => TRUE));
    }

    public function update()
    {
        $this->_validate();
        $id      = $this->input->post('id');
        $save   = array(
            'nama_divisi'   => $this->input->post('nama_divisi')
        );
        $this->Mod_departement->update_departement($id, $save);
        echo json_encode(array("status" => TRUE));
    }

    public function edit_departement($id)
    {
        $data = $this->Mod_departement->get_departement($id);
        echo json_encode($data);
    }

    public function delete()
    {
        $id = $this->input->post('id');
        $this->Mod_departement->delete_departement($id, 'aset_divisi');
        echo json_encode(array("status" => TRUE));
    }
    private function _validate()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if ($this->input->post('nama_divisi') == '') {
            $data['inputerror'][] = 'nama_divisi';
            $data['error_string'][] = 'Departement Cannot Be Empty';
            $data['status'] = FALSE;
        }


        if ($data['status'] === FALSE) {
            echo json_encode($data);
            exit();
        }
    }
}
