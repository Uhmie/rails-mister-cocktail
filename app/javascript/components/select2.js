import $ from "jquery";
import select2 from 'select2';

const multipleSelect = () => {
  $(document).ready(function() {
    $('.select2').select2();
  });
}

export { multipleSelect };
