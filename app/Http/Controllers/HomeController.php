<?php

namespace Lappy\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;


use Lappy\category_user;
use Lappy\User;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        //return view('home');


        //code to fetch data from the database


        $user_name = Auth::user()->name;

        //get user_id

        $user_id = DB::table('users')->where('name',$user_name)->value('id');
        //$user_id = 3;

        //get his categories from the recurring category table

        $reccuring_categories = $this->getCategoryList('recurring_category',$user_id);



        $date_list = $this->getDateList('recurring_category',$user_id);

        $rec_array = explode(',',$reccuring_categories);
        $date_array = explode(',',$date_list);
        //get a random category.



        $index = rand(0,count($rec_array)-1);
        $category_picked = $rec_array[$index];

        // now get the date of this recurring category

        $rec_cat_date = $date_array[$index];

        $today = date("Y-m-d");

        //echo $rec_cat_date.'<br>';

        $diff  = strtotime($rec_cat_date) - strtotime($today);

        if($diff < 7*24*60*60)
        {
            //within a week ad can be shown

            $merchant_list = $this->getMerchants_for_that_category('merchant',$category_picked);
            $merchant_user_list = $this->getMerchants_for_that_user('category_user',$user_id);

            $adlinks_relatable = array();

           foreach($merchant_list as $m_id)
           {
               if(in_array($m_id,explode(',',$merchant_user_list)))
               {
                    array_push($adlinks_relatable,$this->getAd_for_that_merchant('ad_info',$m_id));

               }
           }

            $allads_for_its_category = $this->getallAds_for_that_category('ad_info',$category_picked);


            //trim adlinks based on location

            $user_location = DB::table('category_user')->where('id',$user_id)->value('location');

            $_in = -1;
            foreach($adlinks_relatable as $_a_l)
            {
                $_in++;
                if($this->getAds_location($_a_l)!="ALL")
                {
                    $zip_array = explode(",",$this->getAds_location($_a_l));
                    if(!$zip_array.contains($user_location))
                    {

                            array_splice($adlinks_relatable,$_in,1);

                    }
                }
            }






           return view('home',['ad_sub'=>implode(",",$adlinks_relatable),'ad_all'=>$allads_for_its_category,'user_id'=>$user_id]);

        }

        else
        {
            //normal category pickup from the category list.

            $category_list_user = $this->getCategoryList('category_user',$user_id);
            $category_list_user_array = explode(",",$category_list_user);

            $trimmed_arr = array_values(array_diff($category_list_user_array,$rec_array));

            $index_ = rand(0,count($trimmed_arr)-1);

            $category_picked_ = $trimmed_arr[$index_];

            $merchant_list_ = $this->getMerchants_for_that_category('merchant',$category_picked_);
            $merchant_user_list_ = $this->getMerchants_for_that_user('category_user',$user_id);

            $adlinks_relatable_ = array();

            foreach($merchant_list_ as $m_id)
            {
                if(in_array($m_id,explode(',',$merchant_user_list_)))
                {
                    array_push($adlinks_relatable_,$this->getAd_for_that_merchant('ad_info',$m_id));

                }
            }

            $allads_for_its_category_ = $this->getallAds_for_that_category('ad_info',$category_picked_);


            //trim adlinks based on location

            $user_location_ = DB::table('category_user')->where('id',$user_id)->value('location');

            $_in_ = -1;
            foreach($adlinks_relatable_ as $_a_l)
            {
                $_in_++;
                if($this->getAds_location($_a_l)!="ALL")
                {
                    $zip_array_ = explode(",",$this->getAds_location($_a_l));
                    if(!$zip_array_.contains($user_location_))
                    {

                        array_splice($adlinks_relatable_,$_in_,1);

                    }
                }
            }




            return view('home',['ad_sub'=>implode(",",$adlinks_relatable_),'ad_all'=>$allads_for_its_category_,'user_id'=>$user_id]);



        }




    }

    //retrieve the ad table


    public function getCategoryList($tablename,$user_id)
    {
        $categories = DB::table($tablename)->where('user_id',$user_id)->value('category_list');
        return $categories;
    }


    public function getDateList($tablename,$user_id)
    {
        $datelist =  DB::table($tablename)->where('user_id',$user_id)->value('Expected_date');
        return $datelist;
    }

    public function getMerchants_for_that_category($tablename,$category_id)
    {
        $merchant_id_list = DB::table($tablename)->where('category_id',$category_id)->pluck('merchant_id');
        return $merchant_id_list;
    }

    public function getMerchants_for_that_user($tablename,$user_id)
    {
        $merchant_id_list = DB::table($tablename)->where('user_id',$user_id)->value('merchant_list');
        return $merchant_id_list;
    }

    public function getAd_for_that_merchant($tablename,$merchant_id)
    {
        $million_dollar_baby  = DB::table($tablename)->where('merchant_id',$merchant_id)->value('ad_link_key');
        return $million_dollar_baby;
    }


    public function getallAds_for_that_category($tablename,$category_id)
    {
        $ad_array = DB::table($tablename)->where('category_id',$category_id)->pluck('ad_link_key');
        return $ad_array;
    }

    public function getAds_location($adlink)
    {
        $location = DB::table('ad_info')->where('ad_link_key',$adlink)->value('location_zip');
        return $location;
    }


}
