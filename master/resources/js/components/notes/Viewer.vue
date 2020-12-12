<template>
    <div>
        <div
            class="block note"
            v-for="note in notes"
            :key="note.id"
        >
            <a
                :title="note.title">
                {{ note.title }}
            </a>
            <br>

            <div class="tooltip">
                <button class="note__buttons edit hover:text-green-400 font-bold"
                        @click.prevent.stop="$emit('edit', note)"> Edit
                </button>
                <button class="note__buttons delete hover:text-red-400 font-bold"
                        @click.prevent.stop="deleteNote(note)"> Delete
                </button>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        notes: {
            type: Array,
            default() {
                return []
            }
        }
    },

    methods: {
        deleteNote(note) {
            this.showConfirm({
                title: `Delete ${note.title} note`,
                content: "Are you sure you want to delete this note?",
                confirmationButtonText: "Yes, delete",
                confirm: () => {
                    axios.delete(`note/${note.id}`).then(() => {
                        this.$inertia.reload({
                            only: ['notes'],
                            preserveState: true
                        })
                    })
                }
            })
        }
    }
}
</script>

<style lang="scss">
.note {
    font-weight: bold;
    margin: 5px;
    display: inline-block;
    transition: all ease .3s;
    position: relative;

    &__caller {
        border-bottom: 1px dashed dodgerblue;
    }

    &__buttons {
        margin: 0 5px;
    }

    .tooltip {
        position: absolute;
        display: flex;
        justify-content: space-around;
        top: -30px;
        background: rgba($color: #000000, $alpha: .7);
        display: none;
        transition: all ease .3s;
        color: white;
        padding: 5px 15px;
        border-radius: 8px;
    }

    &:hover {
        color: dodgerblue;

        .tooltip {
            display: flex;
        }
    }

}
</style>

