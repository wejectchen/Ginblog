<template>
  <dir>
    <Editor :init="init" v-model="content"></Editor>
  </dir>
</template>

<script>
import Editor from '@tinymce/tinymce-vue'
import tinymce from './tinymce.min.js'
import './icons/default/icons.min.js'
import './themes/silver/theme.min.js'
import './langs/zh_CN'

// 注册插件
import './plugins/preview/plugin.min.js'
import './plugins/paste/plugin.min.js'
import './plugins/wordcount/plugin.min.js'
import './plugins/code/plugin.min.js'

import './plugins/image/plugin.min.js'
import './plugins/imagetools/plugin.min.js'

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
        margin: '0',
        padding: '0',
        plugins: 'preview paste wordcount code imagetools image',
        branding: false,
        toolbar: [
          'undo redo | formatselect |alignleft aligncenter alignright alignjustify',
          'preview paste code |image',
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
@import url('./skins/ui/oxide/skin.min.css');
</style>