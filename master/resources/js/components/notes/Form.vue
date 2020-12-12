<template>
    <dialog-modal :show="isOpen" @close="$emit('closed')">
        <template #title>
            Add Note
        </template>

        <template #content>
            <form action="" @submit.prevent="save">
                <div>
                    <label for="title"> Content </label>
                    <input type="text" class="form-control" v-model="formData.title">
                </div>
            </form>
        </template>

        <template #footer>
            <primary-button @click.native="$emit('cancel')">
                Cancel
            </primary-button>
            <primary-button @click.native="save()">
                Save Note
            </primary-button>
        </template>
    </dialog-modal>
</template>

<script>
import DialogModal from "../../Jetstream/DialogModal"
import PrimaryButton from "../../Jetstream/Button"

export default {
    components: {
        DialogModal,
        PrimaryButton
    },
    props: {
        isOpen: {
            type: Boolean
        },
        recordData: {
            type: Object
        }
    },
    data() {
        return {
            formData: {}
        }
    },
    watch: {
        recordData() {
            this.formData = this.recordData
        }
    },
    methods: {
        save() {
            const method = this.formData.id ? "PUT" : "POST";
            const param = this.formData.id ? `/${this.formData.id}` : "";
            axios({
                url: `/note${param}`,
                method,
                data: this.formData
            }).then(() => {
                this.$emit('saved');
            });
        },
    }
}
</script>

<style lang="scss">
.form-control {
    @apply w-full bg-gray-100 border-gray-400 border-2 px-4;
    height: 37px;
    border-radius: 4px;
}
</style>
