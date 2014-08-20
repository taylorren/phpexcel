<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of classExcel
 *
 * @author tr
 */

namespace trExcel
{
    require_once 'PHPExcel/Classes/PHPExcel.php';

    class Excel
    {

        public function index($app)
        {
            $data = $this->getData();
            return $app['twig']->render('index.html.twig', array('data' => $data));
        }

        private function getData()
        {
            $dbh = new \PDO('mysql:host=localhost;dbname=sitepoint', 'root', 'tr0210');
            $sql = 'select * from lakers';
            $q = $dbh->query($sql);
            $res = $q->fetchAll(\PDO::FETCH_ASSOC);
            return $res;
        }

        public function export($app)
        {
            $data = $this->getData();

            //Create an Excel instance
            $ea = new \PHPExcel();
            //Add some meta information
            $this->setMeta($ea);
            $ews1 = $this->setData($ea, $data);
            
            $ews2 = $this->addAnalysis($ea);
            //The below line should be moved into addAnalysis but we move this here to show that $ews2 is actually referring to the sheet
            $ews2->getStyle('b4')->getNumberFormat()->setFormatCode(\PHPExcel_Style_NumberFormat::FORMAT_PERCENTAGE_00);
            $this->addChart1($ea, $ews2);
            $this->addChart2($ea, $ews1);

            //Save it
            $writer = \PHPExcel_IOFactory::createWriter($ea, 'Excel2007');
            
            $writer->setIncludeCharts(true);
            $writer->save('output.xlsx');

            return $app['twig']->render('export.html.twig');
        }

        private function setMeta($ea)
        {
            $ea->getProperties()
                    ->setCreator('Taylor Ren')
                    ->setTitle('PHPExcel Demo')
                    ->setLastModifiedBy('Taylor Ren')
                    ->setDescription('A demo to show how to use PHPExcel to manipulate an Excel file')
                    ->setSubject('PHP Excel manipulation')
                    ->setKeywords('excel php office phpexcel lakers')
                    ->setCategory('programming')
            ;
        }

        private function setData(\PHPExcel $ea, $data)
        {
            //Set up the header
            $ews = $ea->getSheet(0);
            $ews->setTitle('Data');
            $ews->setCellValue('a1', 'ID');
            $ews->setCellValue('b1', 'Season');
            $ews->setCellValue('c1', 'Teams');
            $ews->setCellValue('d1', 'Self Score');
            $ews->setCellValue('e1', 'Opponent Score');
            $ews->setCellValue('f1', 'Date Played');
            $ews->setCellValue('g1', 'Win/Lose');
            $ews->setCellValue('h1', 'Remark');
            //Fill data 
            $ews->fromArray($data, ' ', 'A2');
            //Apply header some styles
            $header = 'a1:h1';
            $ews->getStyle($header)->getFill()->setFillType(\PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setARGB('00ffff00');
            $style = array(
                'font' => array('bold' => true,),
                'alignment' => array('horizontal' => \PHPExcel_Style_Alignment::HORIZONTAL_CENTER,),
            );
            $ews->getStyle($header)->applyFromArray($style);
            for ($col = ord('a'); $col <= ord('h'); $col++)
            {
                $ews->getColumnDimension(chr($col))->setAutoSize(true);
            }

            return $ews;
        }

        private function addAnalysis(\PHPExcel $ea)
        {
            $ews2 = new \PHPExcel_Worksheet($ea, 'Summary');
            $ea->addSheet($ews2, 0);
            $ews2->setTitle('Summary');

            $ews2->setCellValue('a1', 'Lakers 2013-2014 Season');
            $style = array(
                'font' => array('bold' => true, 'size' => 20,),
                'alignment' => array('horizontal' => \PHPExcel_Style_Alignment::HORIZONTAL_LEFT,),
            );
            $ews2->mergeCells('a1:b1');
            $ews2->getStyle('a1')->applyFromArray($style);
            $ews2->getColumnDimension('a')->setAutoSize(true);

            $ews2->setCellValue('a2', 'Win:');
            $ews2->setCellValue('a3', 'Loss:');
            $ews2->setCellValue('a4', '%:');

            $ews2->setCellValue('b2', '=COUNTIF(Data!G2:G91, "W")-COUNTIF(Data!G2:G9, "W")');
            $ews2->setCellValue('b3', '=COUNTIF(Data!G2:G91, "L")-COUNTIF(Data!G2:G9, "L")');
            $ews2->setCellValue('b4', '=b2/(b2+b3)');
            //$ews2->getStyle('b4')->getNumberFormat()->setFormatCode(\PHPExcel_Style_NumberFormat::FORMAT_PERCENTAGE_00);

            return $ews2;
        }

        private function addChart1(\PHPExcel $ea, \PHPExcel_Worksheet $ews)
        {
            //The below line should be moved into addAnalysis but we move this here to show that $ews is actually referring to the sheet
            $ews->getStyle('b4')->getNumberFormat()->setFormatCode(\PHPExcel_Style_NumberFormat::FORMAT_PERCENTAGE);
            $title = new \PHPExcel_Chart_Title($ews->getTitle());

            // Set the data serie labels 
            $dsl = array(new \PHPExcel_Chart_DataSeriesValues('String', 'Summary!A1', NULL, 1),
                );
            // Set X-Axis Labels
            $xal = array(new \PHPExcel_Chart_DataSeriesValues('String', 'Summary!A2:A3', NULL, 2),);
            // Set data serie values
            $dsv = array(new \PHPExcel_Chart_DataSeriesValues('Number', 'Summary!B2:B3', NULL, 2),);
            // Build a dataserie
            $ds = new \PHPExcel_Chart_DataSeries(
                    \PHPExcel_Chart_DataSeries::TYPE_PIECHART, 
                    \phpexcel_chart_dataseries::GROUPING_STANDARD, 
                    range(0, count($dsv)-1), 
                    $dsl, 
                    $xal, 
                    $dsv
            );
            // A layout for the Pie Chart
            $layout=new \PHPExcel_Chart_Layout();
            $layout->setShowVal(true);
            $layout->setShowPercent(true);
            // Set series in the plot area
            $pa=new \PHPExcel_Chart_PlotArea($layout, array($ds));
            // Set legend
            $legend=new \PHPExcel_Chart_Legend(\PHPExcel_Chart_Legend::POSITION_RIGHT, NULL, false);
            
            //Create Chart
            $chart= new \PHPExcel_Chart(
                    'chart1',
                    $title,
                    $legend,
                    $pa,
                    true,
                    0,
                    NULL, 
                    NULL
                    );
            
            $chart->setTopLeftPosition('K1');
            $chart->setBottomRightPosition('M5');
            $ews->addChart($chart);
        }
        
        private function addChart2(\PHPExcel $ea, \PHPExcel_Worksheet $ews)
        {
            $title=new \PHPExcel_Chart_Title($ews->getTitle());
            $dsl=array(
                new \PHPExcel_Chart_DataSeriesValues('String', 'Data!$D$1', NULL, 1),
                new \PHPExcel_Chart_DataSeriesValues('String', 'Data!$E$1', NULL, 1),
                
            );
            $xal=array(
                new \PHPExcel_Chart_DataSeriesValues('String', 'Data!$F$2:$F$91', NULL, 90),
            );
            $dsv=array(
                new \PHPExcel_Chart_DataSeriesValues('Number', 'Data!$D$2:$D$91', NULL, 90),
                new \PHPExcel_Chart_DataSeriesValues('Number', 'Data!$E$2:$E$91', NULL, 90),
            );
            
            $ds=new \PHPExcel_Chart_DataSeries(
                    \PHPExcel_Chart_DataSeries::TYPE_LINECHART,
                    \PHPExcel_Chart_DataSeries::GROUPING_STANDARD,
                    range(0, count($dsv)-1),
                    $dsl,
                    $xal,
                    $dsv
            
                    );
            
            $pa=new \PHPExcel_Chart_PlotArea(NULL, array($ds));
            // Set legend
            $legend=new \PHPExcel_Chart_Legend(\PHPExcel_Chart_Legend::POSITION_RIGHT, NULL, false);
            $chart=new \PHPExcel_Chart(
                    'Chart1',
                    $title,
                    $legend,
                    $pa,
                    true,
                    0,
                    NULL,
                    NULL
                    );
            $chart->setTopLeftPosition('I1');
            $chart->setBottomRightPosition('AA21');
            
            $ews->addChart($chart);
            
            return $chart;
            
        }

    }

}
