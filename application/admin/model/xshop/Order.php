<?php

namespace app\admin\model\xshop;

use think\Model;
use traits\model\SoftDelete;

class Order extends Model
{
    use SoftDelete;
    //数据库
    protected $connection = 'database';
    // 表名
    protected $name = 'xshop_order';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;



    // 追加属性
    protected $append = [
        'pay_time_text',
        'create_time_text',
        'update_time_text',
        'delete_time_text',
        'delivery_text'
    ];
    

    /**
     * 支付
     */
    public function pay($id)
    {
        $order = self::get($id);
        if ($order->is_pay == 1) throw new \think\Exception("该订单已支付");
        $order->is_pay = 1;
        $order->pay_time = time();
        $order->payed_price = $order->order_price;
        $order->status = 1;
        $order->save();
        $orderModel = \addons\xshop\model\OrderModel::find($id);
        \think\Hook::listen('xshop_order_pay_ok', $orderModel);
        return $order;
    }

    /**
     * 发货
     */
    public function ship($attributes)
    {
        extract($attributes);
        $order = self::get($id);
        if ($order->is_delivery == 1) throw new \think\Exception("该订单已发货");
        if ($order->is_pay == 0) throw new \think\Exception("该订单未支付");

        $order->is_delivery = 1;
        $order->delivery = time();
        $order->express_code = $express_code;
        $order->express_no = $express_no;
        $order->save();
        \think\Hook::listen('xshop_order_ship', $order);
        return $order;
    }

    /**
     * 拒绝退款
     */

    public function reject($attributes)
    {
        extract($attributes);
        $order = self::where('order_sn', $order_sn)->find();
        $order->after_sale_status = \addons\xshop\model\OrderModel::AFTER_SALE_REJECT;
        $order->after_saler_remark = $after_saler_remark;
        $order->save();
        \think\Hook::listen('xshop_order_reject', $order);
        return true;
    }
    public function getDeliveryTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['delivery']) ? $data['delivery'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    public function getPayTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['pay_time']) ? $data['pay_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getCreateTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['create_time']) ? $data['create_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getUpdateTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['update_time']) ? $data['update_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getDeleteTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['delete_time']) ? $data['delete_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setPayTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }

    protected function setCreateTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }

    protected function setUpdateTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }

    protected function setDeleteTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }


    public function user()
    {
        return $this->belongsTo('app\admin\model\User', 'user_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }

    public function express() {
        return $this->belongsTo('app\admin\model\xshop\Express', 'express_code', 'code', [], 'LEFT')->setEagerlyType(0);
    }
}
