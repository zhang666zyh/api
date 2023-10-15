import {ProColumns, ProTable} from '@ant-design/pro-components';
import '@umijs/max';
import React, {useEffect, useRef} from 'react';
import {Modal} from "antd";

export type FormValueType = {
  target?: string;
  template?: string;
  type?: string;
  time?: string;
  frequency?: string;
} & Partial<API.RuleListItem>;
export type Props = {
  values: API.InterfaceInfo,
  columns: ProColumns<API.InterfaceInfo>[];
  onCancel: () => void;
  onSubmit: (values: API.InterfaceInfo) => Promise<void>;
  visible: boolean;
};
const UpdateModal: React.FC<Props> = (props) => {
  const {columns, visible, onCancel, onSubmit, values} = props;

  const formRef = useRef();
  useEffect(() => {
    if (formRef) {
      formRef.current?.setFieldsValue(values);
    }
  }, [values])


  return (
    <Modal visible={visible} onCancel={() => {
      onCancel?.()
    }} footer={null}>
      <ProTable type="form" columns={columns}
                onSubmit={
                  async (value) => {
                    value.id = values.id
                    onSubmit?.(value)
                  }
                }
                formRef={formRef}
                form={{
                  initialValues: values
                }}/>
    </Modal>
  );
};
export default UpdateModal;
