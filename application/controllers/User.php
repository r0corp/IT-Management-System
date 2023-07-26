<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Create By : rochman@programmer.net
 */
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;


class User extends MY_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Mod_user');

    }

    public function index()
    {
        $this->load->helper('url');
        $data['user'] = $this->Mod_user->getAll();
        $data['user_level'] = $this->Mod_user->userlevel();
        $this->template->load('layoutbackend', 'admin/user_data', $data);
    }

    public function ajax_list()
    {
        ini_set('memory_limit','512M');
        set_time_limit(3600);
        $list = $this->Mod_user->get_datatables();
        $data = array();
        $no = $_POST['start'];
        foreach ($list as $user) {
            $no++;
            $row = array();
            $row[] = $user->image;
            $row[] = $user->username;
            $row[] = $user->full_name;
            $row[] = $user->nama_level;            
            $row[] = $user->is_active;
            $row[] = $user->id_user;
            $data[] = $row;
        }

        $output = array(
                        "draw" => $_POST['draw'],
                        "recordsTotal" => $this->Mod_user->count_all(),
                        "recordsFiltered" => $this->Mod_user->count_filtered(),
                        "data" => $data,
                );
        //output to json format
        echo json_encode($output);
    }

     public function insert()
    {
       // var_dump($this->input->post('username'));
        $this->_validate();
        $username = $this->input->post('username');
        $cek = $this->Mod_user->cekUsername($username);
        if($cek->num_rows() > 0){
            echo json_encode(array("error" => "Username Sudah Ada!!"));
        }else{
            $nama = slug($this->input->post('username'));
            $config['upload_path']   = './assets/foto/user/';
            $config['allowed_types'] = 'gif|jpg|jpeg|png'; //mencegah upload backdor
            $config['max_size']      = '1000';
            $config['max_width']     = '2000';
            $config['max_height']    = '1024';
            $config['file_name']     = $nama; 
            
            $this->upload->initialize($config);
            
            if ($this->upload->do_upload('imagefile')){
            $gambar = $this->upload->data();
            
            $save  = array(
                'username' => $this->input->post('username'),
                'full_name' => $this->input->post('full_name'),
                'password'  => get_hash($this->input->post('password')),
                'id_level'  => $this->input->post('level'),
                'is_active' => $this->input->post('is_active'),
                'image' => $gambar['file_name']
            );
            
            $this->Mod_user->insertUser("tbl_user", $save);
            echo json_encode(array("status" => TRUE));
            }else{//Apabila tidak ada gambar yang di upload
                $save  = array(
                'username' => $this->input->post('username'),
                'full_name' => $this->input->post('full_name'),
                'password'  => get_hash($this->input->post('password')),
                'id_level'  => $this->input->post('level'),
                'is_active' => $this->input->post('is_active')
            );
            
            $this->Mod_user->insertUser("tbl_user", $save);
            echo json_encode(array("status" => TRUE));
            }
        }
    }

    public function viewuser()
    {
            $id = $this->input->post('id');
            $table = $this->input->post('table');
            $data['table'] = $table;
            $data['data_field'] = $this->db->field_data($table);
            $data['data_table'] = $this->Mod_user->view_user($id)->result_array();
            $this->load->view('admin/view', $data);
        
    }

    public function edituser($id)
    {
            
            $data = $this->Mod_user->getUser($id);
            echo json_encode($data);
        
    }


    public function update()
    {
        if(!empty($_FILES['imagefile']['name'])) {
        // $this->_validate();
        $id = $this->input->post('id_user');
        
        $nama = slug($this->input->post('username'));
        $config['upload_path']   = './assets/foto/user/';
        $config['allowed_types'] = 'gif|jpg|jpeg|png'; //mencegah upload backdor
        $config['max_size']      = '1000';
        $config['max_width']     = '2000';
        $config['max_height']    = '1024';
        $config['file_name']     = $nama; 
        
            $this->upload->initialize($config);
            
            if ($this->upload->do_upload('imagefile')){
            $gambar = $this->upload->data();
            //Jika Password tidak kosong
            if ($this->input->post('password')) {
                    $save  = array(
                    'username' => $this->input->post('username'),
                    'full_name' => $this->input->post('full_name'),
                    'password'  => get_hash($this->input->post('password')),
                    'id_level'  => $this->input->post('level'),
                    'is_active' => $this->input->post('is_active'),
                    'image' => $gambar['file_name']
                );
            }else{//Jika password kosong
                $save  = array(
                'username' => $this->input->post('username'),
                'full_name' => $this->input->post('full_name'),
                'id_level'  => $this->input->post('level'),
                'is_active' => $this->input->post('is_active'),
                'image' => $gambar['file_name']
                );
            }
            
            
            $g = $this->Mod_user->getImage($id)->row_array();

            if ($g != null) {
                //hapus gambar yg ada diserver
                unlink('assets/foto/user/'.$g['image']);
            }
            
            $this->Mod_user->updateUser($id, $save);
            echo json_encode(array("status" => TRUE));
            }else{//Apabila tidak ada gambar yang di upload

                 //Jika Password tidak kosong
            if ($this->input->post('password')) {
                    $save  = array(
                    'username' => $this->input->post('username'),
                    'full_name' => $this->input->post('full_name'),
                    'password'  => get_hash($this->input->post('password')),
                    'id_level'  => $this->input->post('level'),
                    'is_active' => $this->input->post('is_active')
                );
            }else{//Jika password kosong
                $save  = array(
                'username' => $this->input->post('username'),
                'full_name' => $this->input->post('full_name'),
                'id_level'  => $this->input->post('level'),
                'is_active' => $this->input->post('is_active')
                );
            }
             
                $this->Mod_user->updateUser($id, $save);
                echo json_encode(array("status" => TRUE));
            }
        }else{
            // $this->_validate();
            $id_user = $this->input->post('id_user');
            if ($this->input->post('password')) {
                $save  = array(
                'username' => $this->input->post('username'),
                'full_name' => $this->input->post('full_name'),
                'password'  => get_hash($this->input->post('password')),
                'id_level'  => $this->input->post('level'),
                'is_active' => $this->input->post('is_active')
                );
            }else{
                $save  = array(
                'username' => $this->input->post('username'),
                'full_name' => $this->input->post('full_name'),
                'id_level'  => $this->input->post('level'),
                'is_active' => $this->input->post('is_active')
                );
            }
            
            $this->Mod_user->updateUser($id_user, $save);
            echo json_encode(array("status" => TRUE));
        }
    }

    public function delete(){
        $id = $this->input->post('id');
        $g = $this->Mod_user->getImage($id)->row_array();
        if ($g != null) {
            //hapus gambar yg ada diserver
            unlink('assets/foto/user/'.$g['image']);
        }
        $this->Mod_user->deleteUsers($id, 'tbl_user');
        $data['status'] = TRUE;
        echo json_encode($data);
    }

    public function reset(){
        $id = $this->input->post('id');
        $data = array(
            'password'  => get_hash('password')
        );
        $this->Mod_user->reset_pass($id, $data);
        $data['status'] = TRUE;
        echo json_encode($data);
    }

    public function download(){
		$spreadsheet = new Spreadsheet();
		$sheet = $spreadsheet->getActiveSheet();

		// Buat sebuah variabel untuk menampung pengaturan style dari header tabel
		$style_col = [
			'font' => ['bold' => true], // Set font nya jadi bold
			'alignment' => [
				'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER, // Set text jadi ditengah secara horizontal (center)
				'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER // Set text jadi di tengah secara vertical (middle)
			],
			'borders' => [
				'top' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN], // Set border top dengan garis tipis
				'right' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN],  // Set border right dengan garis tipis
				'bottom' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN], // Set border bottom dengan garis tipis
				'left' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN] // Set border left dengan garis tipis
			]
		];

		// Buat sebuah variabel untuk menampung pengaturan style dari isi tabel
		$style_row = [
			'alignment' => [
				'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER // Set text jadi di tengah secara vertical (middle)
			],
			'borders' => [
				'top' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN], // Set border top dengan garis tipis
				'right' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN],  // Set border right dengan garis tipis
				'bottom' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN], // Set border bottom dengan garis tipis
				'left' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN] // Set border left dengan garis tipis
			]
		];

		$sheet->setCellValue('A1', "DATA USER"); // Set kolom A1 dengan tulisan "DATA user"
		$sheet->mergeCells('A1:E1'); // Set Merge Cell pada kolom A1 sampai E1
		$sheet->getStyle('A1')->getFont()->setBold(true); // Set bold kolom A1

		// Buat header tabel nya pada baris ke 3
		$sheet->setCellValue('A3', "NO"); // Set kolom A3 dengan tulisan "NO"
		$sheet->setCellValue('B3', "USERNAME"); // Set kolom B3 dengan tulisan "NIS"
		$sheet->setCellValue('C3', "FULLNAME"); // Set kolom C3 dengan tulisan "NAMA"
		$sheet->setCellValue('D3', "PASSWORD"); // Set kolom D3 dengan tulisan "JENIS KELAMIN"
		$sheet->setCellValue('E3', "LEVEL"); // Set kolom E3 dengan tulisan "ALAMAT"
		$sheet->setCellValue('F3', "PHOTO");
		$sheet->setCellValue('G3', "ACTIVE");
		$sheet->setCellValue('H3', "LOKET");

		// Apply style header yang telah kita buat tadi ke masing-masing kolom header
		$sheet->getStyle('A3')->applyFromArray($style_col);
		$sheet->getStyle('B3')->applyFromArray($style_col);
		$sheet->getStyle('C3')->applyFromArray($style_col);
		$sheet->getStyle('D3')->applyFromArray($style_col);
		$sheet->getStyle('E3')->applyFromArray($style_col);
		$sheet->getStyle('F3')->applyFromArray($style_col);
		$sheet->getStyle('G3')->applyFromArray($style_col);
		$sheet->getStyle('H3')->applyFromArray($style_col);

		// Panggil function view yang ada di userModel untuk menampilkan semua data usernya
		$user = $this->Mod_user->getAll()->result();

		$no = 1; // Untuk penomoran tabel, di awal set dengan 1
		$numrow = 4; // Set baris pertama untuk isi tabel adalah baris ke 4
		foreach($user as $data){ // Lakukan looping pada variabel user
			$sheet->setCellValue('A'.$numrow, $no);
			$sheet->setCellValue('B'.$numrow, $data->username);
			$sheet->setCellValue('C'.$numrow, $data->full_name);
			$sheet->setCellValue('D'.$numrow, $data->password);
			$sheet->setCellValue('E'.$numrow, $data->id_level);
			$sheet->setCellValue('F'.$numrow, $data->image);
			$sheet->setCellValue('G'.$numrow, $data->is_active);
			$sheet->setCellValue('H'.$numrow, $data->id_loket);
			
			// Apply style row yang telah kita buat tadi ke masing-masing baris (isi tabel)
			$sheet->getStyle('A'.$numrow)->applyFromArray($style_row);
			$sheet->getStyle('B'.$numrow)->applyFromArray($style_row);
			$sheet->getStyle('C'.$numrow)->applyFromArray($style_row);
			$sheet->getStyle('D'.$numrow)->applyFromArray($style_row);
			$sheet->getStyle('E'.$numrow)->applyFromArray($style_row);
			$sheet->getStyle('F'.$numrow)->applyFromArray($style_row);
			$sheet->getStyle('G'.$numrow)->applyFromArray($style_row);
			$sheet->getStyle('H'.$numrow)->applyFromArray($style_row);
			
			$no++; // Tambah 1 setiap kali looping
			$numrow++; // Tambah 1 setiap kali looping
		}

		// Set width kolom
		$sheet->getColumnDimension('A')->setWidth(5); // Set width kolom A
		$sheet->getColumnDimension('B')->setWidth(15); // Set width kolom B
		$sheet->getColumnDimension('C')->setWidth(25); // Set width kolom C
		$sheet->getColumnDimension('D')->setWidth(20); // Set width kolom D
		$sheet->getColumnDimension('E')->setWidth(30); // Set width kolom E
		$sheet->getColumnDimension('F')->setWidth(30); // Set width kolom E
		$sheet->getColumnDimension('G')->setWidth(30); // Set width kolom E
		$sheet->getColumnDimension('H')->setWidth(30); // Set width kolom E
		
		// Set height semua kolom menjadi auto (mengikuti height isi dari kolommnya, jadi otomatis)
		$sheet->getDefaultRowDimension()->setRowHeight(-1);

		// Set orientasi kertas jadi LANDSCAPE
		$sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);

		// Set judul file excel nya
		$sheet->setTitle("Laporan Data Users");

		// Proses file excel
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment; filename="Data Users.xlsx"'); // Set nama file excel nya
		header('Cache-Control: max-age=0');

		$writer = new Xlsx($spreadsheet);
		$writer->save('php://output');
	}

   
    private function _validate()
    {
        $data = array();
        $data['error_string'] = array();
        $data['inputerror'] = array();
        $data['status'] = TRUE;

        if($this->input->post('username') == '')
        {
            $data['inputerror'][] = 'username';
            $data['error_string'][] = 'Username is required';
            $data['status'] = FALSE;
        }

        if($this->input->post('full_name') == '')
        {
            $data['inputerror'][] = 'full_name';
            $data['error_string'][] = 'Full Name is required';
            $data['status'] = FALSE;
        }

        if($this->input->post('password') == '')
        {
            $data['inputerror'][] = 'password';
            $data['error_string'][] = 'Password is required';
            $data['status'] = FALSE;
        }

        if($this->input->post('is_active') == '')
        {
            $data['inputerror'][] = 'is_active';
            $data['error_string'][] = 'Please select Is Active';
            $data['status'] = FALSE;
        }

        if($this->input->post('level') == '')
        {
            $data['inputerror'][] = 'level';
            $data['error_string'][] = 'Please select is level';
            $data['status'] = FALSE;
        }

        /*if($this->input->post('image') == '')
        {
            $data['inputerror'][] = 'image';
            $data['error_string'][] = 'Image is required';
            $data['status'] = FALSE;
        }*/

        if($data['status'] === FALSE)
        {
            echo json_encode($data);
            exit();
        }
    }
}