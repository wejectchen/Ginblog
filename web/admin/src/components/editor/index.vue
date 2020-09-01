<template>
  <div>
    <Editor :init="init" v-model="content"></Editor>
  </div>
</template>

<script>
import Editor from '@tinymce/tinymce-vue'
<<<<<<< HEAD
import './tinymce.min.js'
import './icons/default/icons.min.js'
import './themes/silver/theme.min.js'
import './langs/zh_CN'
=======
import tinymce from '../../static/tinymce/tinymce.min.js'
import '../../static/tinymce/icons/default/icons.min.js'
import '../../static/tinymce/themes/silver/theme.min.js'
import '../../static/tinymce/langs/zh_CN'
>>>>>>> master

// 注册插件
import '../../static/tinymce/plugins/preview/plugin.min.js'
import '../../static/tinymce/plugins/paste/plugin.min.js'
import '../../static/tinymce/plugins/wordcount/plugin.min.js'
import '../../static/tinymce/plugins/code/plugin.min.js'

import '../../static/tinymce/plugins/image/plugin.min.js'
import '../../static/tinymce/plugins/imagetools/plugin.min.js'
import '../../static/tinymce/plugins/media/plugin.min.js'
import '../../static/tinymce/plugins/codesample/plugin.min.js'
import '../../static/tinymce/plugins/lists/plugin.min.js'
import '../../static/tinymce/plugins/table/plugin.min.js'

export default {
  components: { Editor },
  props: {
    value: {
      type: String,
      default: '',
    },
  },
  data() {
    return {
      init: {
        language: 'zh_CN',
        height: '500px',
        plugins: 'preview paste wordcount code imagetools image media codesample lists table',
        branding: false,
        toolbar: [
          'undo redo | styleselect |fontsizeselect| bold italic underline strikethrough |alignleft aligncenter alignright alignjustify |blockquote removeformat |numlist bullist table',
          'preview paste code codesample |image imagetools media',
        ],
        //上传图片
        images_upload_handler: async (blobInfo, succFun, failFun) => {
          let formdata = new FormData()
          formdata.append('file', blobInfo.blob(), blobInfo.name())
          const { data: res } = await this.$http.post('upload', formdata)
          succFun(res.url)
          failFun(this.$message.error('上传图片失败'))
        },
      },
      content: this.value,
    }
  },
  watch: {
    value(newV) {
      this.content = newV
    },
    content(newV) {
      this.$emit('input', newV)
    },
  },
}
</script>

<style>
@import url('../../static/tinymce/skins/ui/oxide/skin.min.css');
</style>