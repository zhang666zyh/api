import {PageContainer} from '@ant-design/pro-components';
import {Button, Card, Descriptions, Form, Input, message, Spin} from 'antd';
import React, {useEffect, useState} from 'react';
import {
  getInterfaceInfoByIdUsingGET,
  invokeInterfaceInfoUsingPOST
} from "@/services/api-frontend/interfaceInfoController";
import {useParams} from "@@/exports";

/**
 * 主页
 * @constructor
 */
const Index: React.FC = () => {
  const [loading, setLoading] = useState(false);
  const [data, setData] = useState<API.InterfaceInfo[]>([]);
  const [invokeRes, setInvokeRes] = useState<any>();
  const [invokeLoading, setInvokeLoading] = useState(false);
  const params = useParams();

  const loadData = async () => {
    if (!params.id) {
      message.error("参数不存在");
    }

    setLoading(true);
    try {
      const res = await getInterfaceInfoByIdUsingGET({
        id: Number(params.id)
      });
      setData(res.data);
    } catch (e) {
      message.error('请求数据失败');
    }

    setLoading(false);
  }

  const onFinish = async (values: any) => {
    if (!params.id) {
      message.error("接口不存在");
      return;
    }

    setInvokeLoading(true);
    try {
      const res = await invokeInterfaceInfoUsingPOST({
        id: params.id,
        ...values
      })
      setInvokeRes(res.data)
      message.success("请求成功");
    } catch (e) {
      message.error('请求失败');
    }
    setInvokeLoading(false);

  }

  useEffect(() => {
    loadData();
  }, [])


  return (
    <PageContainer title="查看接口文档">
      {/*接口信息*/}
      <Card>
        {
          data ? (
            <Descriptions title={data.name} column={1} extra={<Button>调用</Button>}>
              <Descriptions.Item label="接口状态">{data.status === 0 ? "关闭" : "正常"}</Descriptions.Item>
              <Descriptions.Item label="描述">{data.description}</Descriptions.Item>
              <Descriptions.Item label="请求方法">{data.method}</Descriptions.Item>
              <Descriptions.Item label="请求头">{data.requestHeader}</Descriptions.Item>
              <Descriptions.Item label="请求参数">{data.requestParams}</Descriptions.Item>
              <Descriptions.Item label="响应头">{data.responseHeader}</Descriptions.Item>
              <Descriptions.Item label="创建时间">{data.createTime}</Descriptions.Item>
              <Descriptions.Item label="更新时间">{data.updateTime}</Descriptions.Item>
            </Descriptions>
          ) : <>接口不存在</>
        }
      </Card>
      {/*在线测试接口参数输入框*/}
      <Card>
        <Form
          name="invoke"
          onFinish={onFinish}
          layout="vertical"
        >
          <Form.Item
            label="请求参数"
            name="userRequestParams"
            rules={[{required: true, message: 'Please input your username!'}]}
          >
            <Input.TextArea/>
          </Form.Item>
          <Form.Item wrapperCol={{span: 16}}>
            <Button type="primary" htmlType="submit">
              调用
            </Button>
          </Form.Item>
        </Form>
      </Card>
      {/*调用结果*/}
      <Card>
        <Spin spinning={invokeLoading}>
          {invokeRes}
        </Spin>
      </Card>
    </PageContainer>
  );
};

export default Index;
